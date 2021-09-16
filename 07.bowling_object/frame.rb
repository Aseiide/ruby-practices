# frozen_string_literal: true

require './shot'

STRIKE = 10

class Frame
  attr_reader :shots

  def initialize(shots)
    @shots = shots
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
      shots[0].score + shots[1].score + (shots[2] ? shots[2].score : 0)
    end
  end

  private

  def spare?
    shots[0].score != STRIKE && [shots[0].score, shots[1].score].sum == 10
  end

  def strike?
    shots[0].score == STRIKE
  end

  def spare_score(next_frame)
    shots[0].score + shots[1].score + Frame.new(next_frame).shots[0].score
  end

  def strike_score(index, next_frame_marks, after_next_frame_marks)
    next_frame = Frame.new(next_frame_marks)
    after_next_frame = Frame.new(after_next_frame_marks) unless after_next_frame_marks.nil?

    bonus_point = next_frame.shots[0].score != STRIKE || index == 8 ? next_frame.shots[1].score : after_next_frame.shots[0].score
    shots[0].score + next_frame.shots[0].score + bonus_point
  end
end
