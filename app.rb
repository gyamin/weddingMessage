require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require_relative './model/message.rb'

# production環境設定
set :environment, :production

helpers do
  # HTMLで書けない文字の実体参照と改行コードのHTMLへの置換を行う
  def hbr(target)
    target = ERB::Util.html_escape(target)
    target.gsub(/\r\n|\r|\n/, "<br />")
  end
end

get '/message/name/:name' do
    @bag = {}
    @bag['name'] = params['name'];
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
