require 'sinatra'
require 'sinatra/reloader' # この行を書くと、再起動無しにファイルの変更が反映される
require 'sqlite3'

db = SQLite3::Database.new('work4-1.db')
db.results_as_hash = true

get '/test/4-4' do

  # テンプレートで使う変数には「@」をつける
  @restaurants = db.execute('SELECT * FROM restaurants LIMIT 20;')

  # `views/test4_4_index.erb`テンプレートとして使う
  erb :test4_4_index
end


get '/test/4-4/:id' do

  # テンプレートで使う変数には「@」をつける
  @restaurant = db.execute('SELECT * FROM restaurants WHERE id = ? LIMIT 1;', [params[:id]]).first

  # `views/test4_4_detail.erb`テンプレートとして使う
  erb :test4_4_detail
end
