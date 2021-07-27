# frozen_string_literal: true

# 非スペアかつ非ストライクのとき、first_shotとsecond_shotをsum
# スペアのとき、フレーム.sum + 次のshot
# ストライクのとき、10 + 次のフレーム.sum

require './shot'

class Frame
  attr_reader :first_shot, :second_shot, third_shot

  def initialize(first_mark, second_mark = nil, third_mark = nil)
    @first_shot = Shot.new(first_mark)
    @second_shot = Shot.new(second_mark)
    @third_shot = Shot.new(third_mark)
  end

  # 1フレームのスコア
  def score
    [@first_shot.score, @second_shot.score, @third_shot.score].sum
  end

  def strike?
    @first_shot.score == 10
  end

  def spare?
    @first_shot.score != 10 && [@first_shot.score, @second_shot.score].sum == 10
  end

  def base_score
    @first_shot.score + @second_shot.score if strike? == false && spare? == false
  end
end
