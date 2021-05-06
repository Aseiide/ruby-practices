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
  if index <= 8 # 1~9フレーム
    if f[0] == 10
      point += 10 + frames[next_frame][0]
      if frames[next_frame][0] == 10
        point += frames[next_frame + 1][0]
      else
        point += frames[next_frame][1]
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

# テストケース
# 6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4,5 134となりダメ 139
# 6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,X,X 164.正:164
# 0,10,1,5,0,0,0,0,X,X,X,5,1,8,1,0,4 107.正:107
# 6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,0,0 134.正:134
# X,X,X,X,X,X,X,X,X,X,X,X 300.正:300
# 0,0,0,0,0,0,0,0,0,0,0,0 0 正:0
