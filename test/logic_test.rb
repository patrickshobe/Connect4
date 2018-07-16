# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/emoji'
require './lib/board'
require './lib/logic'

class LogicTest < Minitest::Test
  def test_it_finds_horizontal_wins
    board = Board.new
    board.move(:X, :A)
    board.move(:X, :B)
    board.move(:X, :C)
    board.move(:X, :D)
    logic = Logic.new(board)

    expected = 'Computer'
    actual = logic.check_for_win

    assert_equal expected, actual
  end

  def test_it_finds_vertical_wins
    board = Board.new
    board.move(:X,  :G)
    board.move(:X, :G)
    board.move(:X, :G)
    board.move(:X, :G)
    logic = Logic.new(board)

    expected = 'Computer'
    actual = logic.check_for_win

    assert_equal expected, actual
  end

  def test_it_finds_right_angle_wins
    board = Board.new

    board.move(:X, :F)
    board.move(:X, :F)
    board.move(:X, :F)
    board.move(:X, :F)

    board.move(:X, :E)
    board.move(:X, :E)
    board.move(:X, :E)

    board.move(:X, :D)
    board.move(:X, :D)

    board.move(:X, :C)
    logic = Logic.new(board)

    expected = 'Computer'
    actual = logic.check_for_win

    assert_equal expected, actual
  end

  def test_it_finds_left_angle_wins
    board = Board.new

    board.move(:X, :B)
    board.move(:X, :B)
    board.move(:X, :B)
    board.move(:X, :B)

    board.move(:X, :C)
    board.move(:X, :C)
    board.move(:X, :C)

    board.move(:X, :D)
    board.move(:X, :D)

    board.move(:X, :E)
    logic = Logic.new(board)

    expected = 'Computer'
    actual = logic.check_for_win

    assert_equal expected, actual
  end
end
