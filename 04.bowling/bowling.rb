# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
frames = []
frame = []
point = 0

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

frames.each_with_index do |f, index|
  next_frame = index + 1
  if index <= 8
    if f[0] == 10
      point += 10 + frames[next_frame][0]
      point += if frames[0] == 10
        frames[next_frame + 1][0]
      else
        frames[next_frame][1]
      end
    elsif f.sum == 10
      point += 10 + frames[next_frame][0]
    else
      point += f.sum
    end
  else
    point += f.sum
  end
end

p point
