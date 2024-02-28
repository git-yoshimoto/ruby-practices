#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if shots.length >= 18
    shots << (s == 'X' ? 10 : s.to_i)
  elsif s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  if frames.length >= 10
    frames[9] = frames[9].concat(s)
  else
    frames << s
  end
end

point = 0
frames.each_with_index do |frame, x|
  point += frame.sum
  if x < 8
    # 1〜8フレームの処理
    if frame[0] == 10
      point += frames[x + 1][0] + (frames[x + 1][0] == 10 ? frames[x + 2][0] : frames[x + 1][1])
    elsif frame.sum == 10
      point += frames[x + 1][0]
    end
  elsif x == 8
    # 9フレームの処理
    if frame[0] == 10
      point += frames[x + 1][0] + frames[x + 1][1]
    elsif frame.sum == 10
      point += frames[x + 1][0]
    end
  end
end
puts point
