# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/emoji'
require './lib/piece'

class PieceTest < Minitest::Test
  def test_it_exists
    piece = Piece.new('X')

    assert_instance_of Piece, piece
  end

  def test_it_holds_a_value
    piece = Piece.new('X')

    assert_equal 'X', piece.value
  end
end
