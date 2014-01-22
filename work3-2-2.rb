require 'sinatra'
require 'sinatra/reloader' # この行を書くと、再起動無しにファイルの変更が反映される

get '/work/3-2-2' do

  html = '<h1>RSSから取得</h1>' # 出力する文字を貯める変数
  open('output3-2.txt', 'r') do |file|

    file.each do |line| # CSVファイルは複数行あるので、1行ずつ処理
      html << "#{line}<br>"
    end

  end

  return html



end
