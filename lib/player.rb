# frozen_string_literal: true

# ./lib/player
class Player
  attr_accessor :name,
                :piece
  def initialize
    @name = 'Player 1'
    @piece = :O
  end
end
