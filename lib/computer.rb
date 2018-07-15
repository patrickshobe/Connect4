# frozen_string_literal: true

# ./lib/computer
class Computer
  attr_accessor :name,
                :piece
  def initialize
    @name = 'Blinky'
    @piece = :X
  end
end
