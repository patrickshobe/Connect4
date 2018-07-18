# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/emoji'
require './lib/board'
require './lib/player'
require './lib/Render'

class RenderTest < Minitest::Test

  def test_it_exists
    board = Board.new
    render = Render.new(board)

    assert_instance_of Render, render
  end

  def test_it_displays_empty
    board = Board.new
    render = Render.new(board)

    expected =  "_____________________________\n"\
                "| A | B | C | D | E | F | G |\n"\
                "| - | - | - | - | - | - | - |\n"\
                "| - | - | - | - | - | - | - |\n"\
                "| - | - | - | - | - | - | - |\n"\
                "| - | - | - | - | - | - | - |\n"\
                "| - | - | - | - | - | - | - |\n"\
                "| - | - | - | - | - | - | - |\n"\
                '|___________________________|'
    actual = render.display

    assert_equal expected, actual
  end

  def test_it_renders_pieces
    board = Board.new
    render = Render.new(board)
    board.place_piece(:X, :G)

    expected =  "_____________________________\n"\
                "| A | B | C | D | E | F | G |\n"\
                "| - | - | - | - | - | - | - |\n"\
                "| - | - | - | - | - | - | - |\n"\
                "| - | - | - | - | - | - | - |\n"\
                "| - | - | - | - | - | - | - |\n"\
                "| - | - | - | - | - | - | - |\n"\
                "| - | - | - | - | - | - | X |\n"\
                '|___________________________|'
    actual = render.display

    assert_equal expected, actual
  end
end
