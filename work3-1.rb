require 'sinatra'
require 'sinatra/reloader' # この行を書くと、再起動無しにファイルの変更が反映される

get '/test/3-4' do

  html = '<h1>ニュース</h1>' # 出力する文字を貯める変数
  open('output3-3.txt', 'r') do |file|


    file.each do |line| # CSVファイルは複数行あるので、1行ずつ処理
      text1,text2 = line.split(',')
#      html << "<a href=""http://www.yahoo.co.jp/#{text2}"">#{text1}</a><br>"
      html << "<a href='http://www.yahoo.co.jp/#{text2}'>#{text1}</a><br>"
    end


  end

  return html



end
