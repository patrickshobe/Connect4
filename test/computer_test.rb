# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/emoji'
require './lib/board'
require './lib/Computer'

class ComputerTest < Minitest::Test
  def test_it_exists
    computer = Computer.new

    assert_instance_of Computer, computer
  end

  def test_it_has_a_default_piece
    computer = Computer.new

    assert_equal :X, computer.piece
  end

  def test_it_has_a_name
    computer = Computer.new

    assert_equal 'Blinky', computer.name
  end

  def test_it_chooses_the_opposite_piece
    computer = Computer.new
    player = Player.new
    player.piece = :X

    assert_equal :X, computer.piece
  end
end
