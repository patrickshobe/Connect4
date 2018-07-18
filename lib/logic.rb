# frozen_string_literal: true

require './lib/board'

# ./lib/logic
class Logic
  attr_reader :winner
  def initialize(board_object)
    @game_board = board_object.game_board
    @winner = nil
  end

  def check_for_all_win_conditions
    check_for_horizontal_wins
    check_for_vertical_wins
    check_for_right_diagonal_wins
    check_for_left_diagonal_wins
    @winner
  end

  def check_for_horizontal_wins
    @game_board.each do |row_array|
      player_or_computer_win_validator(row_array)
      break unless @winner.nil?
    end
  end

  def check_for_vertical_wins
    (0..6).each do |column|
      vertical_array = (0..5).map { |row| @game_board[row][column] }
      player_or_computer_win_validator(vertical_array)
      break unless @winner.nil?
    end
  end

  def check_for_right_diagonal_wins
    diagonal_starting_points = [[5, 3], [5, 2], [5, 1], [5, 0], [4, 0], [3, 0]]
    diagonal_starting_points.each do |column_row|
      right_diagonal_array_creator(column_row.first, column_row.last)
      break unless @winner.nil?
    end
  end

  def check_for_left_diagonal_wins
    diagonal_starting_points = [[5, 3], [5, 4], [5, 5], [5, 6], [4, 6], [3, 6]]
    diagonal_starting_points.each do |column_row|
      left_diagonal_array_creator(column_row.first, column_row.last)
      break unless @winner.nil?
    end
  end

  def right_diagonal_array_creator(row, column, diagonal_array = [])
    diagonal_ending_points = [[1, 7], [0, 7], [-1, 7], [-1, 6], [-1, 5], [-1, 4]]
    unless diagonal_ending_points.include?([row, column])
      diagonal_array << @game_board[row][column]
      right_diagonal_array_creator((row - 1), (column + 1), diagonal_array)
    end
    player_or_computer_win_validator(diagonal_array)
  end

  def left_diagonal_array_creator(row, column, diagonal_array = [])
    diagonal_ending_points = [[1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1], [-1, 2]]
    unless diagonal_ending_points.include?([row, column])
      diagonal_array << @game_board[row][column]
      left_diagonal_array_creator((row - 1), (column - 1), diagonal_array)
    end
    player_or_computer_win_validator(diagonal_array)
  end

  def player_or_computer_win_validator(value_array)
    @winner = 'Computer' if value_array.join.include?('XXXX')
    @winner = 'Player' if value_array.join.include?('OOOO')
  end
end
