require 'rubygems'
require 'csv'
require 'rqrcode'
require 'rqrcode_png'

class QrcodeGenerater
    @convert_data = []

    def initialize(data)
        @convert_data = data
    end

    def generate_qrcode()
        @convert_data.each do | elem |
            qr = RQRCode::QRCode.new(elem['url'], :size =>10, :level => :h)
            png = qr.to_img
            png_name = "#{elem['name']}.png"
            png_path = "./image/#{png_name}"
            puts "QRコード:#{png_name}作成"
            #png.save(png_path)
            png.resize(200,200).save(png_path)
        end
    end
end

convert_data = []
CSV.foreach("qr_list.csv") do |row|
    elem = {}
    elem['name'] = row[0]
    elem['url'] = row[1]
    convert_data.push(elem)
end

qr_generater = QrcodeGenerater.new(convert_data)
qr_generater.generate_qrcode()
