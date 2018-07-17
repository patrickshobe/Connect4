# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/emoji'
require './lib/board'
require './lib/logic'

class LogicTest < Minitest::Test
  def test_it_finds_horizontal_wins
    board = Board.new
    board.place_piece(:X, :A)
    board.place_piece(:X, :B)
    board.place_piece(:X, :C)
    board.place_piece(:X, :D)
    logic = Logic.new(board)

    expected = 'Computer'
    actual = logic.check_for_all_win_conditions

    assert_equal expected, actual
  end

  def test_it_finds_vertical_wins
    board = Board.new
    board.place_piece(:X, :G)
    board.place_piece(:X, :G)
    board.place_piece(:X, :G)
    board.place_piece(:X, :G)
    logic = Logic.new(board)

    expected = 'Computer'
    actual = logic.check_for_all_win_conditions

    assert_equal expected, actual
  end

  def test_it_finds_right_angle_wins
    board = Board.new

    board.place_piece(:X, :F)
    board.place_piece(:X, :F)
    board.place_piece(:X, :F)
    board.place_piece(:X, :F)

    board.place_piece(:X, :E)
    board.place_piece(:X, :E)
    board.place_piece(:X, :E)

    board.place_piece(:X, :D)
    board.place_piece(:X, :D)

    board.place_piece(:X, :C)
    logic = Logic.new(board)

    expected = 'Computer'
    actual = logic.check_for_all_win_conditions

    assert_equal expected, actual
  end

  def test_it_finds_left_angle_wins
    board = Board.new

    board.place_piece(:X, :B)
    board.place_piece(:X, :B)
    board.place_piece(:X, :B)
    board.place_piece(:X, :B)

    board.place_piece(:X, :C)
    board.place_piece(:X, :C)
    board.place_piece(:X, :C)

    board.place_piece(:X, :D)
    board.place_piece(:X, :D)

    board.place_piece(:X, :E)
    logic = Logic.new(board)

    expected = 'Computer'
    actual = logic.check_for_all_win_conditions

    assert_equal expected, actual
  end
end
