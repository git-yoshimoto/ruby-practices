#!/usr/bin/env ruby

(1..20).each do |x|
  if x % 3 == 0 && x % 5 == 0
    puts "fizzbuzz"
  elsif x % 3 == 0  
    puts "fizz"
  elsif x % 5 == 0
    puts "buzz"
  else
    puts x
  end
end