#!/usr/bin/ruby                                                                                                                                                          
# encoding: utf-8

require 'sinatra'

enable :sessions

get '/' do
  "User is logged in: #{!session[:user].nil?}"
end

get '/login' do
  session[:user] = true  
  redirect '/'
end  

get '/logout' do
  session[:user] = nil
  redirect '/'
end

get '/break' do
  session[:foo] = ["bär", "möhre"]
  redirect '/'
end

get '/no-break' do
  session[:foo] = ["bear", "carrot"]
  redirect '/'
end