require 'csv'

open('dataset/restaurants.csv', 'r') do |file|

  header = CSV.parse_line(file.gets.chomp)

  while line = file.gets
    begin
      line_array = CSV.parse_line(line.chomp)
    rescue CSV::MalformedCSVError
    end

    puts Hash[header.zip(line_array)]
  end
end
