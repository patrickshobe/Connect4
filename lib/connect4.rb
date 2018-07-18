require './lib/computer.rb'
require './lib/board.rb'
require './lib/logic.rb'
require './lib/player.rb'
require './lib/render.rb'

computer = Computer.new
player = Player.new
board = Board.new
render = Render.new(board)
logic = Logic.new(board)

def player_input_validator(input, board, render)
  if not ('A'..'G').include?(input)
    return "Invalid Input"
  else
    board.place_piece(:O, input.to_sym)
  end
end



puts "Welcome to Connect 4"

while logic.winner.nil?
  puts render.display
  print "Enter a Move => "
  input = gets.chomp
  action = player_input_validator(input, board, render)
  if action == :ROW_FULL
    puts "INVALID MOVE PLEASE TRY AGAIN"
    next
  end
  puts render.display
  logic.check_for_all_win_conditions
  sleep 1
  system 'clear'
  board.place_piece(:X, computer.generate_move)
  logic.check_for_all_win_conditions
  sleep 1
  system 'clear'
end

puts "                        #{logic.winner} wins!                      "
puts "___________________________________________________________________"
