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

    assert_equal expected, board.board
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

    assert_equal expected, board.board
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
    board.move(piece,  :G)
    board.move(piece1, :G)
    board.move(piece2, :G)
    board.move(piece3, :G)
    assert_equal 'Computer', board.win_check
  end

  def test_it_finds_right_angle_wins
    board = Board.new
    piece = Piece.new(:X)
    piece1 = Piece.new(:X)
    piece2 = Piece.new(:X)
    piece3 = Piece.new(:X)

    piece4 = Piece.new(:X)
    piece5 = Piece.new(:X)
    piece6 = Piece.new(:X)

    piece7 = Piece.new(:X)
    piece8 = Piece.new(:X)

    piece9 = Piece.new(:X)


    board.move(piece,  :F)
    board.move(piece1, :F)
    board.move(piece2, :F)
    board.move(piece3, :F)

    board.move(piece4, :E)
    board.move(piece5, :E)
    board.move(piece6, :E)

    board.move(piece7, :D)
    board.move(piece8, :D)

    board.move(piece9, :C)


    assert_equal 'Computer', board.right_check
  end

  def test_it_finds_left_angle_wins
    board = Board.new
    piece = Piece.new(:X)
    piece1 = Piece.new(:X)
    piece2 = Piece.new(:X)
    piece3 = Piece.new(:X)

    piece4 = Piece.new(:X)
    piece5 = Piece.new(:X)
    piece6 = Piece.new(:X)

    piece7 = Piece.new(:X)
    piece8 = Piece.new(:X)

    piece9 = Piece.new(:X)


    board.move(piece,  :B)
    board.move(piece1, :B)
    board.move(piece2, :B)
    board.move(piece3, :B)

    board.move(piece4, :C)
    board.move(piece5, :C)
    board.move(piece6, :C)

    board.move(piece7, :D)
    board.move(piece8, :D)

    board.move(piece9, :E)


    assert_equal 'Computer', board.left_check
  end



end
