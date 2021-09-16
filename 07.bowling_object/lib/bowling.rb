# frozen_string_literal: true

require_relative 'game'

puts Game.new(ARGV[0]).calc_score if __FILE__ == $PROGRAM_NAME
