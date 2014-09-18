require 'rubygems'
require 'csv'
require 'rqrcode'
require 'rqrcode_png'

class QRCode
    @convert_data = []

    def initialize(csv_file)
      convert_data = []
      CSV.foreach(csv_file) do |row|
        elem = {}
        elem['no'] = row[0]
        elem['name'] = row[1]
        elem['url'] = row[2]
        convert_data.push(elem)
      end 
        @convert_data = convert_data
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
    
    attr_reader :convert_data
end

