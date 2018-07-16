# frozen_string_literal: true

require './lib/board'

# ./lib/logic
class Logic
  def initialize(board_object)
    @game_board = board_object.game_board
    @winner = nil
  end

  def check_for_win
    check_for_horizontal_wins
    check_for_vertical_wins
    check_for_right_angle_wins
    check_for_left_angle_wins
    @winner
  end

  def check_for_horizontal_wins
    @game_board.each do |row|
      @winner = checker(row)
      break unless @winner.nil?
    end
    @winner
  end

  def check_for_vertical_wins
    (0..6).each do |column|
      value_array = []
      (0..5).to_a.each { |row| value_array << @game_board[row][column] }
      @winner = checker(value_array)
      break unless @winner.nil?
    end
    @winner
  end

  def check_for_right_angle_wins
    starting_points = [[5, 3], [5, 2], [5, 1], [5, 0], [4, 0], [3, 0]]
    starting_points.each do |point|
      @winner = right_angle_join(point)
      break unless @winner.nil?
    end
    @winner
  end

  def check_for_left_angle_wins
    starting_points = [[5, 3], [5, 4], [5, 5], [5, 6], [4, 6], [3, 6]]
    starting_points.each do |point|
      @winner = left_angle_join(point)
      break unless @winner.nil?
    end
    @winner
  end

  def right_angle_join(starting_point = [5, 3], array = [])
    row = starting_point[0]
    column = starting_point[1]
    unless @game_board[row][column].nil?
      array << @game_board[row][column]
      right_angle_join([(row - 1), (column + 1)], array)
    end
    checker(array)
  end

  def left_angle_join(starting_point = [5, 3], array = [])
    row = starting_point[0]
    column = starting_point[1]
    unless @game_board[row][column].nil?
      array << @game_board[row][column]
      left_angle_join([(row - 1), (column - 1)], array)
    end
    checker(array)
  end

  def checker(array)
    @winner = 'Computer' if array.join.include?('XXXX')
    @winner = 'Player' if array.join.include?('OOOO')
    @winner
  end
end
