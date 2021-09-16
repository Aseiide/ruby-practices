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

  def score(index, next_frame, after_next_frame)
    if strike? && last_frame?(index)
      strike_score(index, next_frame, after_next_frame)
    elsif spare? && last_frame?(index)
      spare_score(next_frame)
    else
      shots.sum { |shot| shot ? shot.score : 0 }
    end
  end

  private

  def spare?
    !shots[0].strike? && [shots[0].score, shots[1].score].sum == 10
  end

  def strike?
    shots[0].strike?
  end

  def spare_score(next_frame)
    shots[0].score + shots[1].score + next_frame.shots[0].score
  end

  def strike_score(index, next_frame, after_next_frame)
    bonus_point = next_frame.shots[0].score != STRIKE || index == 8 ? next_frame.shots[1].score : after_next_frame.shots[0].score
    shots[0].score + next_frame.shots[0].score + bonus_point
  end
end
