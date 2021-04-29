# frozen_string_literal: true
require_relative '../lib/connect_four_board'
require 'colorize'

class ConnectFourGame
  def initialize(board)
    @board = board
    @input = nil
  end

  def play_game(player = 1)
    @board.print_board
    @input = get_input(player)
    @board.make_move(@input, player)
    full = @board.full?
    won = game_won?
    if won
      end_game(player)
    elsif full
      full_board(player)
    else
      player == 1 ? play_game(2) : play_game(1)
    end
  end

  def get_input(player)
    puts "Player #{player}, Please select a column to drop your counter"
    input = gets.chomp
    verified_input = verify_input(input.to_i) if input.match?(/^\d/)
    verified_input.nil? ? get_input(player) : @input = verified_input - 1
  end

  def verify_input(input)
    if input.between?(1, 7)
      @board.column_available?(input - 1).nil? ? nil : input
    else
      nil
    end
  end

  def game_won?
    last_move = @board.last_move
    column = @board.get_column(last_move[1])
    row = @board.get_row(last_move[0])
    diagonal1 = @board.get_diagonal1(last_move)
    diagonal2 = @board.get_diagonal2(last_move)
  
    if row.include?('XXXX') || row.include?('OOOO')
      true
    elsif column.include?('XXXX') || column.include?('OOOO')
      true
    elsif diagonal1.include?('XXXX') || diagonal1.include?('OOOO')
      true
    elsif diagonal2.include?('XXXX') || diagonal2.include?('OOOO')
      true
    else
      false
    end
  end

  def end_game(player)
    puts "Congratulations Player #{player}, you have won the game!".yellow.bold
    @board.print_board
    new_game?(player)
  end

  def full_board(player)
    puts "The board is full and no one has won the game!".red.bold
    new_game?(player)
  end

  def new_game?(player)
    next_player = player == 1 ? 2 : 1
    puts "Would you like to start a new game? Y/N".green.bold
    input = gets.chomp.downcase
    if input = 'y'
      board = ConnectFourBoard.new
      game = ConnectFourGame.new(board)
      game.play_game(next_player)
    end
  end
end