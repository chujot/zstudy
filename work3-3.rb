require 'net/http'
require 'nokogiri'
require 'sqlite3'



USER_AGENT = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'

res = Net::HTTP.start('www.yahoo.co.jp') {|http|
  http.get('/', 'User-Agent' => USER_AGENT)
}

# HTMLを解析
doc = Nokogiri::HTML.parse(res.body)





# 「test3-5.db」というファイル名のデ ータベースを作る
db = SQLite3::Database.new('work3-3.db')

# データベースを作成
db.execute('CREATE TABLE IF NOT EXISTS books (title varchar(30), url varchar(30));')


# データを追加する
doc.css('#topicsfb ul.emphasis a').each { |topic|
  db.execute 'INSERT INTO books values ( ?, ? );', [topic.text, topic.attr('href')]
}


# データベースからデータをすべて取り出す
puts 'select all'
db.execute('SELECT * FROM books;') do |row|
p row
end

# # データベースからデータを検索する
# puts 'select where'
# db.execute('SELECT * FROM books WHERE price = 480;') do |row|
#   p row
# end
