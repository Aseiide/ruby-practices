# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |n|
  case n
  when 'X'
    shots << 10
  else
    shots << n.to_i
  end
end
p shots
