#!/usr/bin/env ruby
require 'optparse'
require 'date'

DAY_OF_WEEK = ["日", "月", "火", "水", "木", "金", "土"] 

today = Date.today
args_yaer_month = ARGV.getopts('y:m:')
argv_year = args_yaer_month["y"]&.to_i || today.year
argv_month = args_yaer_month["m"]&.to_i ||today.month

first_date = Date.new(argv_year, argv_month, 1)
last_day = Date.new(argv_year, argv_month, -1).day

puts "      #{argv_month}月 #{argv_year}"
DAY_OF_WEEK.each do |day_of_week|
  print day_of_week + " "
end
puts ""
print "   " * first_date.next_day(0).wday
(0...(last_day -1)).each do |x|
  print first_date.next_day(x).day.to_s.rjust(2) + " "
  puts "" if first_date.next_day(x).cwday == 6
end
puts "\n\n"
