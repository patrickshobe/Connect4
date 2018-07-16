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
    expected = [['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-','-','-', '-']]

    assert_equal expected, board.game_board
  end

  def test_it_holds_a_piece
    board = Board.new
    expected = [['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-','-','-', :X]]
    board.move(:X, :G)

    assert_equal expected, board.game_board
  end

  def test_it_stacks_pieces
    board = Board.new
    expected = [['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', :X],
                ['-', '-', '-', '-','-','-', :X]]
    board.move(:X, :G)
    board.move(:X, :G)

    assert_equal expected, board.game_board
  end
end
