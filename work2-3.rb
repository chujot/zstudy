require 'net/http'
require 'nokogiri'

USER_AGENT = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'

res = Net::HTTP.start('www.yahoo.co.jp') {|http|
  http.get('/', 'User-Agent' => USER_AGENT)
}

# HTMLを解析
doc = Nokogiri::HTML.parse(res.body)

puts doc.css('h1 img').attr('src')





# doc.css('#topicsfb ul.emphasis a').each { |link|
#   puts "#{link.text},#{link.text}"

#   # 上で取得した「aタグ」それぞれに対して中身を表示する
# }




# <div id="topicsfb" class="current"><div class="topicsindex"><em>9時1分更新</em>
# ul class="emphasis"><li><a href="f/topics/top/1/*-http://dailynews.yahoo.co.jp/fc/domestic/hanshin_awaji_earthquake/?id=6103995">阪神大震災から19年 冥福祈る</a><span class="iconVideo" title="動画">動画</span></li>
# <li><a href="f/topics/top/2/*-http://dailynews.yahoo.co.jp/fc/world/missile_defense_system/?id=6103999">ミサイル発射 宇宙から監視へ</a><span class="iconPhoto" title="写真">写真</span><span class="iconNew" title="NEW">NEW</span></li><li><a href="f/topics/top/3/*-http://dailynews.yahoo.co.jp/fc/domestic/osumi_collision/?id=6103994">海自艦 危険回避行動をとる?</a><span class="iconPhoto" title="写真">写真</span></li><li><a href="f/topics/top/4/*-http://dailynews.yahoo.co.jp/fc/science/norovirus/?id=6104005">浜松児童905人欠席の異常事態</a><span class="iconPhoto" title="写真">写真</span><span class="iconNew" title="NEW">NEW</span></li><li><a href="f/topics/top/5/*-http://dailynews.yahoo.co.jp/fc/domestic/smoking/?id=6103979">職場で電子たばこ 悩む米企業</a></li>
