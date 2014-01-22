require 'nokogiri'
require 'open-uri'

USER_AGENT = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
#

url = 'http://rss.dailynews.yahoo.co.jp/fc/rss.xml'
xml = Nokogiri::XML(open(url).read)

doc = xml.xpath('//item')

open('output3-2.txt', 'w') do |file| # 書き込みなので「w」

  doc.xpath('//item/title').each { |title|
    file.write "#{title.text}\n" # 最後に改行が必要
  }
end

require 'sinatra'
require 'sinatra/reloader' # この行を書くと、再起動無しにファイルの変更が反映される

get '/work/3-2-1' do

  html = '<h1>RSSから取得</h1>' # 出力する文字を貯める変数
  open('output3-2.txt', 'r') do |file|

    file.each do |line| # CSVファイルは複数行あるので、1行ずつ処理
      html << "#{line}<br>"
    end

  end

  return html



end
