# frozen_string_literal: true

require './lib/piece'

# ./lib/board
class Board
  attr_accessor :board
  def initialize
    @board = [['-', '-', '-', '-', '-','-', '-'],
              ['-', '-', '-', '-', '-','-', '-'],
              ['-', '-', '-', '-', '-','-', '-'],
              ['-', '-', '-', '-', '-','-', '-'],
              ['-', '-', '-', '-', '-','-', '-'],
              ['-', '-', '-', '-','-','-', '-']]
  end

  def move(piece, column, row = 5)
    column_key = {A: 0, B: 1, C: 2, D: 3, E: 4, F: 5, G: 6}
    if @board[row][column_key[column]] == '-'
      @board[row][column_key[column]] = piece.value
    else
      move(piece, column, (row - 1))
    end
  end

  def win_check
    winner = ''

    # Lateral Check
    @board.each do |row|
      if row.join.include?("XXXX")
        winner = 'Computer'
        break
      elsif row.join.include?("OOOO")
        winner = 'Player'
        break
      end
    end

    # Vertical Check

    (0..6).each do |column|
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

    # Horizontal_positive_check
    # starting_points[@board[5][columns[4]], ]
    winner
  end
end
