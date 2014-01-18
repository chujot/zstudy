require 'net/http'

USER_AGENT = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
res = Net::HTTP.start('www.yahoo.co.jp') {|http|
  http.get('/', 'User-Agent' => USER_AGENT)
}

res.body =~ /id="topicsfb".+?id=\d+?">(.+?)<\/a>.+?id=\d+?">(.+?)<\/a>.+?id=\d+?">(.+?)<\/a>.+?id=\d+?">(.+?)<\/a>.+?id=\d+?">(.+?)<\/a>.+?id=\d+?">(.+?)<\/a>.+?id=\d+?">(.+?)<\/a>.+?id=\d+?">(.+?)<\/a>/

# [^a] => a以外
# ^ ＝＞ 行頭

puts $1
puts $2
puts $3
puts $4
puts $5
puts $6
puts $7
puts $8


