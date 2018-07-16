# frozen_string_literal: true

require './lib/piece'

# ./lib/board
class Board
  attr_accessor :board
  def initialize
    @board = [['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', '-', '-', '-', '-', '-']]
    @array = []
  end

  def move(piece, column, row = 5)
    column_key = { A: 0, B: 1, C: 2, D: 3, E: 4, F: 5, G: 6 }
    if @board[row][column_key[column]] == '-'
      @board[row][column_key[column]] = piece.value
    else
      move(piece, column, (row - 1))
    end
  end

  def horizontal_win_check
    winner = ''
    @board.each do |row|
      winner = checker(row)
      break unless winner.nil?
    end
    winner
  end

  def vertical_win_check
    winner = ''
    (0..6).each do |column|
      value_array = []
      (0..5).to_a.each { |row| value_array << @board[row][column] }
      winner = checker(value_array)
      break if winner != nil
    end
    winner
  end


  def right_check
    starting_points = [[5, 3], [5, 2], [5, 1], [5, 0], [4, 0], [3, 0]]
    winner = nil
    starting_points.each do |point|
      winner = right_angle_join(point)
      if winner != nil
        break
      end
    end
    winner
  end

  def left_check
    starting_points = [[5, 3], [5, 4], [5, 5], [5, 6], [4, 6], [3, 6]]
    winner = nil
    starting_points.each do |point|
      winner = left_angle_join(point)
      if winner != nil
        break
      end
    end
    winner
  end

  def right_angle_join(starting_point=[5, 3])
    row = starting_point[0]
    column = starting_point[1]
    if @board[row][column] != nil
      @array << @board[row][column]
      right_angle_join([(row -= 1), (column += 1)])
    else
      return checker(@array)
    end
  end

  def left_angle_join(starting_point = [5, 3])
    row = starting_point[0]
    column = starting_point[1]
    if @board[row][column] != nil
      @array << @board[row][column]
      left_angle_join([(row -= 1), (column -= 1)])
    else
      return checker(@array)
    end
  end

  def checker(array)
    if array.join.include?('XXXX')
      winner = "Computer"
    elsif array.join.include?('OOOO')
      winner = "Player"
    end
    winner
  end

end
