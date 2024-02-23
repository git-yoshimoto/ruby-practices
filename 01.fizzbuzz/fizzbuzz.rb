#!/usr/bin/env ruby

(1..20).each do |x|
  if (x % 15).zero?
    puts 'fizzbuzz'
  elsif (x % 3).zero?
    puts 'fizz'
  elsif (x % 5).zero?
    puts 'buzz'
  else
    puts x
  end
end
