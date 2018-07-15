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
    expected = [{ 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' }]

    assert_equal expected, board.board
  end

  def test_it_holds_a_piece
    board = Board.new
    piece = Piece.new('X')
    expected = [{ 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => piece }]
    board.move(piece, 'G')

    assert_equal expected, board.board
  end

  def test_it_stacks_pieces
    board = Board.new
    piece = Piece.new('X')
    piece1 = Piece.new('O')
    expected = [{ 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => '-' },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => piece1 },
                { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                  'F' => '-', 'G' => piece }]
    board.move(piece, 'G')
    board.move(piece1, 'G')

    assert_equal expected, board.board
  end
end
