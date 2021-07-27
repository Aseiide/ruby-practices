# frozen_string_literal: true

require './frame'

class Game
  def input_shot(score)
    scores = score.split('')
    scores.map do |score|
      @shot = Shot.new(score).shot_score
    end
  end
end

input = "6390038273X9180X645"
game = Game.new
p shots = game.input_shot(input)
