# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/emoji'
require './lib/board'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_it_is_anonymous_to_begin
    player = Player.new

    assert_equal 'Player 1', player.name
  end

  def test_it_has_a_default_piece
    player = Player.new

    assert_equal :O, player.piece
  end

  def test_it_updates_a_name
    player = Player.new
    player.name = 'Patrick'

    assert_equal 'Patrick', player.name
  end
end
