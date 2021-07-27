# frozen_string_literal: true

require './game'

# ARGVで文字列を受け取る
score = ARGV[0]

# 計算した結果を出力
game = Game.new(score)
p game.score
