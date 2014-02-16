require 'sinatra'
require 'sinatra/reloader' # この行を書くと、再起動無しにファイルの変更が反映される
require 'sqlite3'

db = SQLite3::Database.new('work4-1.db')
db.results_as_hash = true


get '/work/4-2/?page=:id' do

  pagecount = params[:id]

  # テンプレートで使う変数には「@」をつける
  @restaurants = db.execute('SELECT * FROM restaurants LIMIT 5 OFFSET ?', [params[:id]*5])

  # prevtest = params[:id].to_i - 1
  # データの件数を取得

  @countall = db.execute('SELECT count(*) FROM restaurants')
  @countall2 = "SELECT count(*) FROM restaurants"

  #【"前へ" ページが０の時非表示にする】◯以上のとき以外は非表示
  unless params[:id].to_i <= 0
   @prev = "<a href=""/work/4-2/page=#{params[:id].to_i - 1 }"">まえへ</a>"
  end

  #【"次へ" ページが最後の時非表示にする】◯以上のときは非表示
  # unless params[:id].to_i >= @countall.to_i
  #  @prev = "<a href=""/work/4-2/page=#{params[:id].to_i - 1 }"">まえへ</a>"
  # end



  @next = "/work/4-2/page=#{ params[:id].to_i + 1 }"

  @next1 = "/work/4-2/page=#{ params[:id].to_i + 1 }"
  @next2 = "/work/4-2/page=#{ params[:id].to_i + 2 }"
  @next3 = "/work/4-2/page=#{ params[:id].to_i + 3 }"
  @next4 = "/work/4-2/page=#{ params[:id].to_i + 4 }"

  @prev1 = "/work/4-2/page=#{ params[:id].to_i - 1 }"
  @prev2 = "/work/4-2/page=#{ params[:id].to_i - 2 }"
  @prev3 = "/work/4-2/page=#{ params[:id].to_i - 3 }"
  @prev4 = "/work/4-2/page=#{ params[:id].to_i - 4 }"


  # `views/test4_4_index.erb`テンプレートとして使う
  erb :work4_2_index
end


get '/test/4-4/:id' do

  # テンプレートで使う変数には「@」をつける
  @restaurant = db.execute('SELECT * FROM restaurants WHERE id = ? LIMIT 1;', [params[:id]]).first

  # `views/test4_4_detail.erb`テンプレートとして使う
  erb :test4_4_detail
end
