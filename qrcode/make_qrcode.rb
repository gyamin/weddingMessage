require 'rubygems'
require_relative './qrcode.rb'

qrcode = QRCode.new('qr_list.csv')
qrcode.generate_qrcode()
