# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |n|
  case n
  when 'X'
    shots << 10
    shots << 0
  when 'S'
    shots << 10
  else
    shots << n.to_i
  end
end
p shots

frames = []
shots.each_slice(2) do |n|
  frames << n
end
p frames

point = 0
frames.each do |frame|
  if frame[0] == 10
    point += 30
  elsif frame.sum == 10
    point += frame[0] + 10
  else
    point += frame.sum
  end
end
p point
