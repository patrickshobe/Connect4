# frozen_string_literal: true

require './lib/board'
require './lib/piece'

# ./lib/render
class Render
  def initialize(board)
    @board = board
  end

  def display
    "_____________________________\n"\
    "| A | B | C | D | E | F | G |\n"\
    "| #{@board[0][:A]} | #{@board[0][:B]} | #{@board[0][:C]} | #{@board[0][:D]} | #{@board[0][:E]} | #{@board[0][:F]} | #{@board[0][:G]} |\n"\
    "| #{@board[1][:A]} | #{@board[1][:B]} | #{@board[1][:C]} | #{@board[1][:D]} | #{@board[1][:E]} | #{@board[1][:F]} | #{@board[1][:G]} |\n"\
    "| #{@board[2][:A]} | #{@board[2][:B]} | #{@board[2][:C]} | #{@board[2][:D]} | #{@board[2][:E]} | #{@board[2][:F]} | #{@board[2][:G]} |\n"\
    "| #{@board[3][:A]} | #{@board[3][:B]} | #{@board[3][:C]} | #{@board[3][:D]} | #{@board[3][:E]} | #{@board[3][:F]} | #{@board[3][:G]} |\n"\
    "| #{@board[4][:A]} | #{@board[4][:B]} | #{@board[4][:C]} | #{@board[4][:D]} | #{@board[4][:E]} | #{@board[4][:F]} | #{@board[4][:G]} |\n"\
    "| #{@board[5][:A]} | #{@board[5][:B]} | #{@board[5][:C]} | #{@board[5][:D]} | #{@board[5][:E]} | #{@board[5][:F]} | #{@board[5][:G]} |\n"\
    "|___________________________|"
  end
end
