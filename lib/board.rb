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
    @array = []
  end

  def move(piece, column_letter, row_index = 5)
    column_key = { A: 0, B: 1, C: 2, D: 3, E: 4, F: 5, G: 6 }
    column_index = column_key[column_letter]
    if @game_board[row_index][column_index] == '-'
      @game_board[row_index][column_index] = piece
    else
      move(piece, column_letter, (row_index - 1))
    end
  end

  def horizontal_win_check
    winner = ''
    @game_board.each do |row|
      winner = checker(row)
      break unless winner.nil?
    end
    winner
  end

  def vertical_win_check
    winner = ''
    (0..6).each do |column|
      value_array = []
      (0..5).to_a.each { |row| value_array << @game_board[row][column] }
      winner = checker(value_array)
      break unless winner.nil?
    end
    winner
  end

  def right_check
    starting_points = [[5, 3], [5, 2], [5, 1], [5, 0], [4, 0], [3, 0]]
    winner = nil
    starting_points.each do |point|
      winner = right_angle_join(point)
      break unless winner.nil?
    end
    winner
  end

  def left_check
    starting_points = [[5, 3], [5, 4], [5, 5], [5, 6], [4, 6], [3, 6]]
    winner = nil
    starting_points.each do |point|
      winner = left_angle_join(point)
      break unless winner.nil?
    end
    winner
  end

  def right_angle_join(starting_point = [5, 3])
    row = starting_point[0]
    column = starting_point[1]
    unless @game_board[row][column].nil?
      @array << @game_board[row][column]
      right_angle_join([(row - 1), (column + 1)])
    end
    checker(@array)
  end

  def left_angle_join(starting_point = [5, 3])
    row = starting_point[0]
    column = starting_point[1]
    unless @game_board[row][column].nil?
      @array << @game_board[row][column]
      left_angle_join([(row - 1), (column - 1)])
    end
    checker(@array)
  end

  def checker(array)
    winner = 'Computer' if array.join.include?('XXXX')
    winner = 'Player' if array.join.include?('OOOO')
    winner
  end
end
