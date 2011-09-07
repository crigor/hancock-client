# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hancock-client}
  s.version = "0.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Corey Donohoe"]
  s.autorequire = %q{hancock-client}
  s.date = %q{2009-07-04}
  s.description = %q{Hancock SSO rack middleware written in sinatra}
  s.email = ["atmos@atmos.org", "tim@spork.in"]
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.files = ["LICENSE", "README.md", "Rakefile", "lib/hancock-client", "lib/hancock-client/default.rb", "lib/hancock-client/helpers", "lib/hancock-client/helpers/rack.rb", "lib/hancock-client/middleware.rb", "lib/hancock-client/mock_middleware.rb", "lib/hancock-client/sso.rb", "lib/hancock-client.rb", "spec/hancock_sinatra_spec.rb", "spec/mock_sso_user_spec.rb", "spec/pattern_exclusion_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/atmos/hancock-client}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Hancock SSO rack middleware written in sinatra}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      #s.add_runtime_dependency(%q<sinatra>, ["~> 0.9.2"])
      s.add_runtime_dependency(%q<sinatra>, ["~> 1.1.0"])
      #s.add_runtime_dependency(%q<sinatra>, ["= 1.1.0"])
      #s.add_runtime_dependency(%q<sinatra>)
      s.add_runtime_dependency(%q<ruby-openid>, ["~> 2.1.6"])
      #s.add_runtime_dependency(%q<haml>, ["~> 2.0.9"])
      s.add_runtime_dependency(%q<haml>)
      s.add_runtime_dependency(%q<rack-openid>, ["~> 0.2"])
    else
      s.add_dependency(%q<sinatra>, ["~> 0.9.2"])
      s.add_dependency(%q<ruby-openid>, ["~> 2.1.6"])
      s.add_dependency(%q<haml>, ["~> 2.0.9"])
      s.add_dependency(%q<rack-openid>, ["~> 0.2"])
    end
  else
    s.add_dependency(%q<sinatra>, ["~> 0.9.2"])
    s.add_dependency(%q<ruby-openid>, ["~> 2.1.6"])
    s.add_dependency(%q<haml>, ["~> 2.0.9"])
    s.add_dependency(%q<rack-openid>, ["~> 0.2"])
  end
end
