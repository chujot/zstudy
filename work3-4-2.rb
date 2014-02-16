require 'sqlite3'
require 'sinatra'
require 'sinatra/reloader' # この行を書くと、再起動無しにファイルの変更が反映される


get '/work/3-4' do

  # 「test3-5.db」というファイル名のデ ータベースを使う
  db = SQLite3::Database.new('work3-3.db')
  db.results_as_hash = true


  html = '<h1>データベースに保存して表示</h1>'

 # db.execute( "select * from books" ) do |row|
  db.execute( 'SELECT * FROM books;' ) do |row|

    html << "#{row['title']} のURL #{row['url']} <br>"
  end

  return html
end
