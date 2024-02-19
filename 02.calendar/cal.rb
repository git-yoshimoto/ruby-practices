#!/usr/bin/env ruby
require 'optparse'
require 'date'

DAY_OF_WEEK = { 
  0 => "日" ,  
  1 => "月", 
  2 => "火", 
  3 => "水", 
  4 => "木", 
  5 => "金", 
  6 => "土",
}

today = Date.today
get_args = ARGV.getopts('y:m:')
argv_year = get_args["y"] == nil ?  today.year : get_args["y"].to_i 
argv_month = get_args["m"] == nil ? today.month : get_args["m"].to_i 

target_date = Date.new(argv_year, argv_month)

puts "      #{argv_month}月 #{argv_year}"
DAY_OF_WEEK.each_value do |day_of_week|
  print day_of_week + " "
end
puts ""
(0..30).each do |x|
  break if target_date.next_day(x).month != argv_month 
  if x == 0 
    target_date.next_day(x).wday.times do
      print "   "
    end
  end
  print target_date.next_day(x).day.to_s.ljust(3)
  puts "" if target_date.next_day(x).cwday == 6
end

puts "\n\n"