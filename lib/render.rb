# frozen_string_literal: true

require './lib/board'


# ./lib/render
class Render
  def initialize(board)
    @board = board.game_board
  end

  def display
    "_____________________________\n"\
    "| A | B | C | D | E | F | G |\n"\
    "| #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} | #{@board[0][3]} | #{@board[0][4]} | #{@board[0][5]} | #{@board[0][6]} |\n"\
    "| #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} | #{@board[1][3]} | #{@board[1][4]} | #{@board[1][5]} | #{@board[1][6]} |\n"\
    "| #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} | #{@board[2][3]} | #{@board[2][4]} | #{@board[2][5]} | #{@board[2][6]} |\n"\
    "| #{@board[3][0]} | #{@board[3][1]} | #{@board[3][2]} | #{@board[3][3]} | #{@board[3][4]} | #{@board[3][5]} | #{@board[3][6]} |\n"\
    "| #{@board[4][0]} | #{@board[4][1]} | #{@board[4][2]} | #{@board[4][3]} | #{@board[4][4]} | #{@board[4][5]} | #{@board[4][6]} |\n"\
    "| #{@board[5][0]} | #{@board[5][1]} | #{@board[5][2]} | #{@board[5][3]} | #{@board[5][4]} | #{@board[5][5]} | #{@board[5][6]} |\n"\
    "|___________________________|"
  end

  def display_html
    "<html>_____________________________<br>"\
    "| A | B | C | D | E | F | G |<br>"\
    "| #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} | #{@board[0][3]} | #{@board[0][4]} | #{@board[0][5]} | #{@board[0][6]} |<br>"\
    "| #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} | #{@board[1][3]} | #{@board[1][4]} | #{@board[1][5]} | #{@board[1][6]} |<br>"\
    "| #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} | #{@board[2][3]} | #{@board[2][4]} | #{@board[2][5]} | #{@board[2][6]} |<br>"\
    "| #{@board[3][0]} | #{@board[3][1]} | #{@board[3][2]} | #{@board[3][3]} | #{@board[3][4]} | #{@board[3][5]} | #{@board[3][6]} |<br>"\
    "| #{@board[4][0]} | #{@board[4][1]} | #{@board[4][2]} | #{@board[4][3]} | #{@board[4][4]} | #{@board[4][5]} | #{@board[4][6]} |<br>"\
    "| #{@board[5][0]} | #{@board[5][1]} | #{@board[5][2]} | #{@board[5][3]} | #{@board[5][4]} | #{@board[5][5]} | #{@board[5][6]} |<br>"\
    "|___________________________|</html>"
  end
end
