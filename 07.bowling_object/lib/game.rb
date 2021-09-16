# frozen_string_literal: true

require_relative 'frame'

class Game
  def initialize(argv)
    @frames = separate_frames(argv)
  end

  def calc_score
    @frames.map.with_index { |frame, index| frame.score(index, @frames[index.next], @frames[index.next.next]) }.sum
  end

  def separate_frames(argv)
    shots = argv.split(',').map { |m| Shot.new(m) }

    frames = []
    9.times do
      frames << if shots.first.strike?
                  Frame.new(shots.shift(1))
                else
                  Frame.new(shots.shift(2))
                end
    end
    frames << Frame.new(shots)
  end
end
