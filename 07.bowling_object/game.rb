# frozen_string_literal: true

require './frame'

class Game
  def initialize(argv)
    @frames = separate_frames(argv)
  end

  def calc_score
    @frames.map.with_index { |frame, index| Frame.new(*frame).score(index, @frames[index.next], @frames[index.next.next]) }.sum
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
