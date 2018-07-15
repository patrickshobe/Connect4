# frozen_string_literal: true

require './lib/piece'

# ./lib/board
class Board
  attr_accessor :board
  def initialize
    @board = [{ 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                'F' => '-', 'G' => '-' },
              { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                'F' => '-', 'G' => '-' },
              { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                'F' => '-', 'G' => '-' },
              { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                'F' => '-', 'G' => '-' },
              { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                'F' => '-', 'G' => '-' },
              { 'A' => '-', 'B' => '-', 'C' => '-', 'D' => '-', 'E' => '-',
                'F' => '-', 'G' => '-' }]
  end

  def move(piece, column, row = 5)
    if @board[row][column] == '-'
      @board[row][column] = piece
    else
      move(piece, column, (row - 1))
    end
  end
end
