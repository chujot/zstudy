require 'net/http'

result = Net::HTTP.get('www.yahoo.co.jp', '/')

result =~ /<title>(.+?)<\/title>/

puts $1
