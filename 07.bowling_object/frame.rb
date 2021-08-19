# frozen_string_literal: true

require './shot'

STRIKE = 10

class Frame
  # attr_reader :first_shot, :second_shot, :third_shot

  def initialize(first_shot, second_shot = nil, third_shot = nil)
    @first_shot = Shot.new(first_shot)
    @second_shot = Shot.new(second_shot)
    @third_shot = Shot.new(third_shot)
  end

  def last_frame?(index)
    index < 9
  end

  def score(index, next_frame_marks, after_next_frame_marks)
    if strike? && last_frame?(index)
      strike_score(index, next_frame_marks, after_next_frame_marks)
    elsif spare? && last_frame?(index)
      spare_score(next_frame_marks)
    else
      @first_shot.score + @second_shot.score + @third_shot.score
    end
  end

  private

  def spare?
    @first_shot.score != STRIKE && [@first_shot.score, @second_shot.score].sum == 10
  end

  def strike?
    @first_shot.score == STRIKE
  end

  def spare_score(next_frame)
    @first_shot.score + @second_shot.score + Frame.new(*next_frame).@first_shot.score
  end

  def strike_score(index, next_frame_marks, after_next_frame_marks)
    next_frame = Frame.new(*next_frame_marks)
    after_next_frame = Frame.new(*after_next_frame_marks) unless after_next_frame_marks.nil?

    bonus_point = next_frame.@first_shot.score != STRIKE || index == 8 ? next_frame.@second_shot.score : after_next_frame.@first_shot.score
    @first_shot.score + next_frame.@first_shot.score + bonus_point
  end
end
