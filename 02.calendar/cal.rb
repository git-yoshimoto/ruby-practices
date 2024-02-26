#!/usr/bin/env ruby
require 'optparse'
require 'date'

DAY_OF_WEEK = ["日", "月", "火", "水", "木", "金", "土"] 

today = Date.today
args_yaer_month = ARGV.getopts('y:m:')
argv_year = args_yaer_month["y"]&.to_i || today.year
argv_month = args_yaer_month["m"]&.to_i ||today.month

first_date = Date.new(argv_year, argv_month, 1)
last_date = Date.new(argv_year, argv_month, -1)

puts "      #{argv_month}月 #{argv_year}"
print DAY_OF_WEEK.join(' ')

puts ""
print "   " * first_date.wday

(first_date..last_date).each do |date|
  print date.day.to_s.rjust(2) + " "
  puts "" if date.saturday?
end

puts "\n\n"
