# frozen_string_literal: true

# ./lib/board
class Board
  attr_accessor :game_board
  def initialize
    @game_board = [['-', '-', '-', '-', '-', '-', '-'],
                   ['-', '-', '-', '-', '-', '-', '-'],
                   ['-', '-', '-', '-', '-', '-', '-'],
                   ['-', '-', '-', '-', '-', '-', '-'],
                   ['-', '-', '-', '-', '-', '-', '-'],
                   ['-', '-', '-', '-', '-', '-', '-']]
  end

  def place_piece(piece, column_letter, row_index = 5)
    return :ROW_FULL if row_index.negative?
    column_key = { A: 0, B: 1, C: 2, D: 3, E: 4, F: 5, G: 6 }
    column_index = column_key[column_letter]
    if @game_board[row_index][column_index] == '-'
      @game_board[row_index][column_index] = piece
    else
      place_piece(piece, column_letter, (row_index - 1))
    end
  end
end
