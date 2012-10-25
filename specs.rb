# encoding: UTF-8
require "#{File.dirname(__FILE__)}/app"
require 'minitest/autorun'
require 'rack/test'

set :environment, :test

describe 'the app' do
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  it 'is not logged in' do
    get '/'
    last_response.body.wont_include "true"
  end
  
  it 'is logged in' do
    get '/login'
    follow_redirect!
    last_response.body.must_include "true"
  end
  
  it 'lets you login and logout' do
    get '/login'
    get '/logout'
    follow_redirect!
    last_response.body.wont_include "true"
  end
  
  it 'lets you login and not break anything' do
    get '/login'
    get '/no-break'
    follow_redirect!
    last_response.body.must_include "true"
  end
  
  it 'lets you login and not break anything with an umlaut' do
    get '/login'
    get '/break'
    follow_redirect!      
    last_response.body.must_include "true"
  end
end
