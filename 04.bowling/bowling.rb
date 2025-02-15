# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = shots.each_slice(2).to_a

point = frames.each_with_index.sum do |f, index|
  next_frame = index.next
  if index <= 8 # 1~9フレーム
    if f[0] == 10
      if frames[next_frame][0] == 10
        20 + frames[next_frame + 1][0]
      else
        10 + frames[next_frame][0] + frames[next_frame][1]
      end
    elsif f.sum == 10
      10 + frames[next_frame][0]
    else
      f.sum
    end
  else # 10フレーム
    f.sum
  end
end
p point
