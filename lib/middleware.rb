require 'tmpdir'

module Hancock
  module SSO
    def self.registered(app)
      app.use(Rack::OpenID, OpenID::Store::Filesystem.new("#{Dir.tmpdir}/openid"))
      app.helpers Hancock::Helpers::Rack

      app.before do 
        next if request.path_info == '/sso/login'
        next if request.path_info == '/sso/logout'
        next if excluded_path?
        next if sso_logged_in?
        throw(:halt, [302, {'Location' => '/sso/login'}, ''])
      end

      app.get '/sso/login' do
        if contact_id = params['id']
          response['WWW-Authenticate'] = Rack::OpenID.build_header(
            :identifier => "#{options.sso_url}/users/#{contact_id}",
            :trust_root => absolute_url('/sso/login')
          )
          throw :halt, [401, 'got openid?']
        elsif openid = request.env["rack.openid.response"]
          if openid.status == :success
            if contact_id = openid.display_identifier.split("/").last
              sreg_params = openid.message.get_args("http://openid.net/extensions/sreg/1.1")
              sso_login_as(contact_id, sreg_params)
              redirect '/'
            else
              raise "No contact could be found for #{openid.display_identifier}"
            end
          else
            throw :halt, [503, "Error: #{openid.status}"]
          end
        else
          redirect "#{options.sso_url}/login?return_to=#{absolute_url('/sso/login')}"
        end
      end

      app.get '/sso/logout' do
        session.clear
        redirect "#{options.sso_url}/logout"
      end
    end
  end
end
