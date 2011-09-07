require 'rubygems'
require 'bundler/setup'
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'hancock-client'))

class HancockClientDemo < Sinatra::Base
  enable :sessions
  set :views, File.dirname(__FILE__)+'/views'
  set :public, File.dirname(__FILE__)+'/public'

  include Hancock::Client::Helpers::Rack

  use Hancock::Client::Middleware do |sso|
    sso.sso_url = 'http://localhost:9292'
  end

  get '/' do
    haml(:home)
  end
end

run HancockClientDemo
