# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
frame = []
scores.each do |s|
  if s == 'X'
    frame << 10
    frame << 0
  else
    frame << s.to_i
  end
end

frames = []
frame.each_slice(2) do |s|
  frames << s
end

point = 0
frames.each_with_index do |f, index|
  next_frame = index + 1
  if index <= 8 # 1~9フレーム
    if f[0] == 10
      point += 10 + frames[next_frame][0]
      point += if frames[next_frame][0] == 10
                 frames[next_frame + 1][0]
               else
                 frames[next_frame][1]
               end
    elsif f.sum == 10
      point += 10 + frames[next_frame][0]
    else
      point += f.sum
    end
  else # 10フレーム
    point += f.sum
  end
end
p point
