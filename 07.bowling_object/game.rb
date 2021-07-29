# frozen_string_literal: true

require './frame'

class Game
  attr_reader :frames

  def initialize(argv)
    @frames = separate_frames(argv)
  end

  def calc_score
    frames.map.with_index { |frame, index| Frame.new(*frame).score(index, frames[index.next], frames[index.next.next]) }.sum
  end

  def separate_frames(argv)
    shots = argv.split(',').map { |shot| shot == 'X' ? STRIKE : shot.to_i }

    frames = []
    9.times do
      frame = shots.shift(2)

      if frame.first == STRIKE
        frames << [frame.first, 0]
        shots.unshift(frame.last)
      else
        frames << frame
      end
    end
    frames << shots
    # irb(#<Game:0x00007fd1a2942ca0>):001:0> frames
    # => [[6, 3], [9, 0], [0, 3], [8, 2], [7, 3], [10, 0], [9, 1], [8, 0], [10, 0], [6, 4, 5]]
  end
end
