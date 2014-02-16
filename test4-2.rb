require 'sqlite3'
require 'csv'

# データベースを作成
db = SQLite3::Database.new('test4-2.db')

# id(数値),name(文字列),address(文字列)のカラムを生成
# CREATE TABLE IF NOT EXISTS 既に同名のテーブルが存在するときに何も行いません
db.execute(%q{
  CREATE TABLE IF NOT EXISTS restaurants (
    id INTEGER,
    name TEXT,
    address TEXT
  );
})

open('dataset/restaurants.csv', 'r') do |file|
  #配列にする 字列の末尾の改行文字を取り除く
  header = CSV.parse_line(file.gets.chomp)

#読み込み
  while line = file.gets
    begin
      line_array = CSV.parse_line(line.chomp)
    rescue CSV::MalformedCSVError
    end

    csv_line = Hash[header.zip(line_array)]

    # データを追加する
    db.execute 'INSERT INTO restaurants (id, name, address) values ( ?, ?, ? );',
      [csv_line['id'], csv_line['name'], csv_line['address']]

  end
end
