# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
frames = []
frame = []

scores.each do |n|
  n == 'X' ? frame << 10 : frame << n.to_i
  if frame.count == 1 && frame.first == 10
    frames << frame
    frame = []
  elsif frame.count == 2
    frames << frame
    frame = []
  end
end
