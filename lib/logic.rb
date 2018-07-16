# frozen_string_literal: true

require './lib/piece'
require './lib/board'

# ./lib/logic
class Logic
  def initialize(game_board)
    @game_board = game_board.game_board
    @array = []
    @winner = nil
  end

  def check_for_win
    horizontal_win_check
    vertical_win_check
    right_check
    left_check
    @winner
  end

  def horizontal_win_check
    @game_board.each do |row|
      @winner = checker(row)
      break unless @winner.nil?
    end
    @winner
  end

  def vertical_win_check
    (0..6).each do |column|
      value_array = []
      (0..5).to_a.each { |row| value_array << @game_board[row][column] }
      @winner = checker(value_array)
      break unless @winner.nil?
    end
    @winner
  end

  def right_check
    starting_points = [[5, 3], [5, 2], [5, 1], [5, 0], [4, 0], [3, 0]]
    starting_points.each do |point|
      @winner = right_angle_join(point)
      break unless @winner.nil?
    end
    @winner
  end

  def left_check
    starting_points = [[5, 3], [5, 4], [5, 5], [5, 6], [4, 6], [3, 6]]
    starting_points.each do |point|
      @winner = left_angle_join(point)
      break unless @winner.nil?
    end
    @winner
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
    @winner = 'Computer' if array.join.include?('XXXX')
    @winner = 'Player' if array.join.include?('OOOO')
    @winner
  end
end
