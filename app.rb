require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require_relative './model/message.rb'

# production環境設定
set :environment, :production

get '/message/name/:name' do
    @bag = {}
    @bag['name'] = params['name'];
    puts 'step1'
    erb :index 
end

get '/message/:hash' do
    @bag = {}
    message = Message.new
    @bag['message'] = message.find_by_hash(params['hash'])
    p @bag
    erb :index 
end

get '/test/test' do
    erb :test
end
