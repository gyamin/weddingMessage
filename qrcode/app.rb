require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require_relative './qrcode.rb'

# production環境設定
set :environment, :production
# publicディレクトリ指定
set :public_folder, File.dirname(__FILE__) + '/image'

get '/qrcode' do
    qrcode = QRCode.new('qr_list.csv')
    @bag = qrcode.convert_data
    erb :qrcode
end
