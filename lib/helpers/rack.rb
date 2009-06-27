module Hancock
  module Helpers
    module Rack
      def sso_logged_in?
        session[:sso] && sso_user_id
      end

      def sso_login_as(user_id, sreg_params)
        session.delete(:last_oidreq)
        session.delete('OpenID::Consumer::last_requested_endpoint')
        session.delete('OpenID::Consumer::DiscoveredServices::OpenID::Consumer::')

        session[:sso] ||= { }
        session[:sso][:user_id] = user_id
        sreg_params.each { |key, value| session[:sso][key.to_sym] = value.to_s }
      end

      def sso_user_id
        session[:sso][:user_id]
      end

      def sso_user_email
        session[:sso][:email]
      end

      def sso_user_first_name
        session[:sso][:first_name]
      end

      def sso_user_last_name
        session[:sso][:last_name]
      end

      def sso_user_full_name
        "#{session[:sso][:first_name]} #{session[:sso][:last_name]}"
      end
    end
  end
end