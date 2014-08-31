require 'sqlite3'

class Message
    @dbh
    @table

    def initialize
#        @dbh = SQLite3::Database.new "./../database/wedding.db"
        @dbh = SQLite3::Database.new "./database/wedding.db"
        @table = "messages"
    end

    def find_by_id(id)
        sql = "select * from #{@table} where id  = :id"
        stm = @dbh.prepare sql
        rows = stm.execute id
        return rows
    end

    def find_by_hash(hash)
        rows = []
        @dbh.results_as_hash = true     # 結果をhashで取得(デフォルト配列)
        sql = "select * from #{@table} where hash  = :hash"
        stm = @dbh.prepare sql
        results = stm.execute hash 
        results.each do |row|
            rows.push(row)
        end
        return rows[0]
    end
end

#msg = Message.new
#rows =  msg.find_by_hash('22cb59b87e844cb4e6ee4c79b0098028f287e985')
#rows.each do |row|
#    p row
#end
