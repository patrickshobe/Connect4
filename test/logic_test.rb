# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/emoji'
require './lib/piece'
require './lib/board'
require './lib/logic'

class LogicTest < Minitest::Test
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
    logic = Logic.new(board)

    expected = 'Computer'
    actual = logic.check_for_win

    assert_equal expected, actual
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
    logic = Logic.new(board)

    expected = 'Computer'
    actual = logic.check_for_win

    assert_equal expected, actual
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
    logic = Logic.new(board)

    expected = 'Computer'
    actual = logic.check_for_win

    assert_equal expected, actual
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
    logic = Logic.new(board)

    expected = 'Computer'
    actual = logic.check_for_win

    assert_equal expected, actual
  end
end
