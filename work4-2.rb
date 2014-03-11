require 'sinatra'
require 'sinatra/reloader' # この行を書くと、再起動無しにファイルの変更が反映される
require 'sqlite3'

db = SQLite3::Database.new('work4-1.db')
db.results_as_hash = true


get '/work/4-2' do

  pagecount = params[:page]


  # テンプレートで使う変数には「@」をつける
  @restaurants = db.execute('SELECT * FROM restaurants WHERE name like ? LIMIT 5 OFFSET ? ', ["%#{params['keyword']}%" ,params[:page].to_i * 5 - 5 ])
  # @restaurants = db.execute('SELECT * FROM restaurants WHERE name like ?', "%#{params['keyword']}%")

  # prevtest = params[:id].to_i - 1
  # データの件数を取得
  @countall = db.execute('SELECT count(*) FROM restaurants')[0]['count(*)']

  #ページ数
  @pagecountall = (@countall / 5 ) - (5 * 2)


  #【"前へ" ページが０の時非表示にする】◯以上のとき以外は非表示  unless params[:id].to_i <= 0
  unless params[:page].to_i <= 1
   @prev = "<a href='/work/4-2?page=#{params[:page].to_i - 1 }'><<前へ</a>"
  end

  #85694
  #【"次へ" ページが最後の時非表示にする】◯以上のときは非表示
  unless params[:page].to_i >= @pagecountall
    @next = "<a href='/work/4-2?page=#{params[:page].to_i + 1 }'>>>次へ</a>"
  end

  # # 前後 のページを数字でリンクを出す

  unless params[:page].to_i <= 1
    @prev1 = "<li><a href='/work/4-2?page=#{ params[:page].to_i - 1 }'>#{params[:page].to_i - 1 }</a></li>"
  end
  unless params[:page].to_i-2 <= 0 || params[:page].to_i-2 >= @pagecountall
    @prev2 = "<li><a href='/work/4-2?page=#{ params[:page].to_i - 2 }'>#{params[:page].to_i - 2}</a></li>"
  end

  unless params[:page].to_i+1 <= 0 || params[:page].to_i >= @pagecountall
    @next1 = "<li><a href='/work/4-2?page=#{ params[:page].to_i + 1 }'>#{params[:page].to_i + 1}</a></li>"
  end
  unless params[:page].to_i+2 <= 0 || params[:page].to_i+ 1 >= @pagecountall
   @next2 = "<li><a href='/work/4-2?page=#{ params[:page].to_i + 2 }'>#{params[:page].to_i + 2}</a></li>"
  end


  # #【"前へ" ページが０の時非表示にする】◯以上のとき以外は非表示
  # unless params[:page].to_i <= 0
  #   @prev = "<a href='/work/4-2?page=#{params[:page].to_i - 1 }'><<前へ</a>"
  # end

  # #【"次へ" ページが最後の時非表示にする】◯以上のときは非表示
  # unless params[:page].to_i <= 0 || params[:page].to_i >= @pagecountall
  # @next = "<a href='/work/4-2?page=#{params[:page].to_i + 1 }'>>>次へ</a>"
  # end


  # # 前後 のページを数字でリンクを出す

  # unless params[:id].to_i <= 0 || params[:id].to_i-1 >= @pagecountall
  #   @prev1 = "<li><a href='/work/4-2?page=#{ params[:id].to_i - 1 }'>#{params[:id].to_i - 1}</a></li>"
  # end
  # unless params[:id].to_i-2 <= 0 || params[:id].to_i-2 >= @pagecountall
  #   @prev2 = "<li><a href='/work/4-2?page=#{ params[:id].to_i - 2 }'>#{params[:id].to_i - 2}</a></li>"
  # end

  # unless params[:id].to_i+1 <= 0 || params[:id].to_i >= @pagecountall
  #   @next1 = "<li><a href='/work/4-2?page=#{ params[:id].to_i + 1 }'>#{params[:id].to_i + 1}</a></li>"
  # end
  # unless params[:id].to_i+2 <= 0 || params[:id].to_i+ 1 >= @pagecountall
  #  @next2 = "<li><a href='/work/4-2?page=#{ params[:id].to_i + 2 }'>#{params[:id].to_i + 2}</a></li>"
  # end



  # テンプレートとして使う
  erb :work4_2_index
end


get '/work/4-2/:id' do

  # テンプレートで使う変数には「@」をつける
  @restaurant = db.execute('SELECT * FROM restaurants WHERE id = ? LIMIT 1;', [params[:id]]).first

  # `views/test4_4_detail.erb`テンプレートとして使う
  erb :test4_4_detail
end
