# frozen_string_literal: true

require './lib/piece'

# ./lib/board
class Board
  attr_accessor :board
  def initialize
    @board = [{ A:  '-', B:  '-', C:  '-', D:  '-', E:  '-',
                F:  '-', G:  '-' },
              { A:  '-', B:  '-', C:  '-', D:  '-', E:  '-',
                F:  '-', G:  '-' },
              { A:  '-', B:  '-', C:  '-', D:  '-', E:  '-',
                F:  '-', G:  '-' },
              { A:  '-', B:  '-', C:  '-', D:  '-', E:  '-',
                F:  '-', G:  '-' },
              { A:  '-', B:  '-', C:  '-', D:  '-', E:  '-',
                F:  '-', G:  '-' },
              { A:  '-', B:  '-', C:  '-', D:  '-', E:  '-',
                F:  '-', G:  '-' }]
  end

  def move(piece, column, row = 5)
    if @board[row][column] == '-'
      @board[row][column] = piece.value
    else
      move(piece, column, (row - 1))
    end
  end

  def win_check
    winner = ''

    # Lateral Check
    @board.each do |row|
      if row.values.join.include?("XXXX")
        winner = 'Computer'
        break
      elsif row.values.join.include?("OOOO")
        winner = 'Player'
        break
      end
    end

    # Vertical Check

    columns = %I[A B C D E F G]

    columns.each do |column|
      value_array = []
      (0..5).to_a.each do |row|
        value_array << @board[row][column]
      end

      if value_array.join.include?("XXXX")
        winner = 'Computer'
        break
      elsif value_array.join.include?("OOOO")
        winner = 'Player'
        break
      end
    end
    winner
  end
end
