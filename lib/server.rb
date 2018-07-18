require 'socket'
require './lib/computer.rb'
require './lib/board.rb'
require './lib/logic.rb'
require './lib/player.rb'
require './lib/render.rb'

server = TCPServer.new(9292)

def player_input_validator(input, board)
  if not ('A'..'G').include?(input)
    return "Invalid Input"
  else
    board.place_piece(:O, input.to_sym)
  end
end

computer = Computer.new
player = Player.new
board = Board.new
render = Render.new(board)
logic = Logic.new(board)

loop do
  if logic.winner.nil?


  puts "Got the request..."
  request_lines = []
  line = connection.gets.chomp
  while !line.empty?
    request_lines << line
    line = connection.gets.chomp
  end

  board_response = status + "\r\n" + "\r\n" + render.display_html
  connection.puts board_response
  connection.puts "<hmtl></html>"
  puts request_lines

  request_line = request_lines[0]
  if request_line.include? '?'
    path = request_line.split[1]
    params = path.split("move=")
    move = params[-1].upcase
  else
    next
  end


  puts "Sending response."
  action = player_input_validator(move, board)
  if action == :ROW_FULL
    output = "INVALID MOVE PLEASE TRY AGAIN"
    response = output
    connection.puts response
    next
  end

  logic.check_for_all_win_conditions
  board.place_piece(:X, computer.generate_move)
  connection.puts render.display_html
  logic.check_for_all_win_conditions


end

end
