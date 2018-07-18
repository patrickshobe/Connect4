# frozen_string_literal: true

# ./lib/computer
class Computer
  attr_accessor :name,
                :piece
  def initialize
    @name = 'Blinky'
    @piece = :X
  end

  def generate_move
    %I[A B C D E F G].sample
  end
end
