# frozen_string_literal: true

require '../lib/bowling'
require 'minitest/autorun'

class BowlingTest < Minitest::Test
  def test_calc_1
    assert_equal 139, Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4,5').calc_score
  end

  def test_calc_2
    assert_equal 164, Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,X,X').calc_score
  end

  def test_calc_3
    assert_equal 107, Game.new('0,10,1,5,0,0,0,0,X,X,X,5,1,8,1,0,4').calc_score
  end

  def test_calc_zero
    assert_equal 0, Game.new('0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0').calc_score
  end

  def test_calc_perfect
    assert_equal 300, Game.new(('X,X,X,X,X,X,X,X,X,X,X,X')).calc_score
  end
end
