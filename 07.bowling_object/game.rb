# frozen_string_literal: true

require './frame'

class Game
  def initialize(argv)
    @marks_list = separate_frames(argv)
  end

  def calc_score
    @marks_list.map.with_index { |frame, index| Frame.new(*frame).score(index, @marks_list[index.next], @marks_list[index.next.next]) }.sum
  end

  def separate_frames(argv)
    shots = argv.split(',').map { |shot| shot == 'X' ? STRIKE : shot.to_i }

    frames = []
    9.times do
      frames << if shots.first == STRIKE
                  [shots.shift, 0]
                else
                  shots.shift(2)
                end
    end
    frames << shots
  end
end
