# frozen_string_literal: true

class Board
  attr_accessor :status

  def initialize
    # set the board structure
    @status = 'In progress'
    @board_moves = Array.new(3) { Array.new(3) } # create the 3x3 grid
  end

  def make_move(player)
    # take the x & y coordinate from the player
    puts "Player #{player}'s turn..."
    puts 'Enter the x coordinate (index 0 from top) you want to move:'
    x = gets.chomp.to_i
    puts 'Enter the y coordinate (index 0 from left) you want to move:'
    y = gets.chomp.to_i

    if !board_moves[y][x].nil?
      puts 'Move already made here! Try again'
      return make_move(player)
    else
      save_move(x, y, player)
    end

    display_board

    determine_outcome
  end

  private

  attr_accessor :board_moves

  def save_move(x_coord, y_coord, player)
    board_moves[y_coord][x_coord] = player
  end

  def display_board
    board_moves.each do |row|
      display_row = row.map { |move| move || ' ' }
      puts display_row * '|'
    end
  end

  def determine_winner
    # bunch of OR logic to check for completeness
    # If there is a winner, return non-nil winner. Else return nil.

    # entire row is one player
    winner = row_winner
    # entire column is one player
    winner = column_winner if winner.nil?
    winner = diagonal_winner if winner.nil?

    winner
  end

  def row_winner
    board_moves.each do |row|
      return row[0] if (!row[0].nil? && row[0] == row[1]) && (row[0] == row[2])
    end
    nil
  end

  def column_winner
    board_moves.transpose.each do |column|
      return column[0] if (!column[0].nil? && column[0] == column[1]) && (column[0] == column[2])
    end
    nil
  end

  def diagonal_winner
    if (board_moves.dig(0, 0) == board_moves.dig(1, 1)) && (board_moves.dig(0, 0) == board_moves.dig(2, 2))
      return board_moves.dig(0, 0)
    elsif (board_moves.dig(0, 2) == board_moves.dig(1, 1)) && (board_moves.dig(2, 0) == board_moves.dig(1, 1))
      return board_moves.dig(1, 1)
    end

    nil
  end

  def determine_outcome
    winner = determine_winner
    if !winner.nil?
      self.status = 'Complete'
      puts "#{winner} is the winner! Congratulations"
    elsif stalemate?
      self.status = 'Complete'
      puts 'Stalemate! Good game X & O'
    end
  end

  def stalemate?
    board_moves.flatten.compact.length == board_moves.flatten.length
  end
end
