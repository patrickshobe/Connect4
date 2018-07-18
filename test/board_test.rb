# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/emoji'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_starts_with_an_empty_board
    board = Board.new

    expected = [['-', '-', '-', '-', '-', '-', '-'],
                ['-', '-', '-', '-', '-', '-', '-'],
                ['-', '-', '-', '-', '-', '-', '-'],
                ['-', '-', '-', '-', '-', '-', '-'],
                ['-', '-', '-', '-', '-', '-', '-'],
                ['-', '-', '-', '-', '-', '-', '-']]
    actual = board.game_board

    assert_equal expected, actual
  end

  def test_it_holds_and_stacks_pieces
    board = Board.new
    board.place_piece(:X, :G)
    board.place_piece(:X, :G)

    expected = [['-', '-', '-', '-', '-', '-', '-'],
                ['-', '-', '-', '-', '-', '-', '-'],
                ['-', '-', '-', '-', '-', '-', '-'],
                ['-', '-', '-', '-', '-', '-', '-'],
                ['-', '-', '-', '-', '-', '-', :X],
                ['-', '-', '-', '-', '-', '-', :X]]
    actual = board.game_board

    assert_equal expected, actual
  end

  def test_it_returns_full_when_full
    board = Board.new
    board.place_piece(:X, :G)
    board.place_piece(:X, :G)
    board.place_piece(:O, :G)
    board.place_piece(:O, :G)
    board.place_piece(:X, :G)
    board.place_piece(:X, :G)
    board.place_piece(:X, :G)

    expected = :ROW_FULL

    actual = board.place_piece(:O, :G)

    assert_equal expected,  actual
  end
end
