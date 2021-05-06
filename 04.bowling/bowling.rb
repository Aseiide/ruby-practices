# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
frame = []
frames = []

scores.each do |n|
  if n == 'X'
    frame << 10
  else
    frame << n.to_i
  end

  if frame.count == 1 && frame.first == 10
    frames << frame
    frame = []
  elsif frame.count == 2
    frames << frame
    frame = []
  end
end
p frame
p frames
