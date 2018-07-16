# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/emoji'
require './lib/piece'
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
    piece = Piece.new('X')
    expected = [['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-','-','-', piece.value]]
    board.move(piece, :G)

    assert_equal expected, board.game_board
  end

  def test_it_stacks_pieces
    board = Board.new
    piece = Piece.new('X')
    piece1 = Piece.new('O')
    expected = [['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', '-'],
                ['-', '-', '-', '-', '-','-', piece1.value],
                ['-', '-', '-', '-','-','-', piece.value]]
    board.move(piece, :G)
    board.move(piece1, :G)

    assert_equal expected, board.game_board
  end
end
