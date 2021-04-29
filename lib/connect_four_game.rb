# frozen_string_literal: true
require_relative '../lib/connect_four_board'

class ConnectFourGame
  def initialize(board)
    @board = board
    @input = nil
  end

  def play_game(player = 1)
    @board.print_board
    @input = get_input(player)
    @board.make_move(@input, player)
    game_won?
    player == 1 ? play_game(2) : play_game(1)
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
    
  end
end