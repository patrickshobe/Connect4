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
    expected = [{ A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' }]

    assert_equal expected, board.board
  end

  def test_it_holds_a_piece
    board = Board.new
    piece = Piece.new('X')
    expected = [{ A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: piece.value }]
    board.move(piece, :G)

    assert_equal expected, board.board
  end

  def test_it_stacks_pieces
    board = Board.new
    piece = Piece.new('X')
    piece1 = Piece.new('O')
    expected = [{ A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: '-' },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: piece1.value },
                { A: '-', B: '-', C: '-', D: '-', E: '-',
                  F: '-', G: piece.value }]
    board.move(piece, :G)
    board.move(piece1, :G)

    assert_equal expected, board.board
  end

  def test_it_finds_horizontal_wins
    board = Board.new
    piece = Piece.new(:X)
    piece1 = Piece.new(:X)
    piece2 = Piece.new(:X)
    piece3 = Piece.new(:X)
    board.move(piece, :A)
    board.move(piece1, :B)
    board.move(piece2, :C)
    board.move(piece3, :D)
    assert_equal 'Computer', board.win_check
  end

  def test_it_finds_vertical_wins
    board = Board.new
    piece = Piece.new(:X)
    piece1 = Piece.new(:X)
    piece2 = Piece.new(:X)
    piece3 = Piece.new(:X)
    board.move(piece, :G)
    board.move(piece1, :G)
    board.move(piece2, :G)
    board.move(piece3, :G)
    assert_equal 'Computer', board.win_check
  end



end
