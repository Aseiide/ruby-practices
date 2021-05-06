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
puts "frames= #{frames}"

# 計算のロジックを書いていく
# とりあえず1~9フレーム目まで
point = 0
frames.each.with_index do |k, i|
  binding.irb
  # puts "#{i} #{k}"
  point += if i != 8 && i != 9
              if frames[i][0] == 10 && frames[i+1][0] == 10 && frames[i+2][0] == 10
                30
              elsif frames[i][0] == 10 && frames[i+1][0] == 10
                20
              elsif frames[i][0] == 10
                10
              elsif k.sum == 10
                frames[i+1][0] + 10
              else
                k.sum
              end
            end
end
