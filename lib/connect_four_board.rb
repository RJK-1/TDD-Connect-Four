# frozen_string_literal: true

class ConnectFourBoard
  attr_accessor :board, :last_move

  def initialize
    @board = make_board
    @last_move = []
  end
  
  def make_board
    # Board[0] is the bottom row, Board[5] is the top row. 7 items in each.
    @board = Array.new(6) { Array.new(7, ' ') }
  end

  def print_board
    puts <<~HEREDOC

       1 2 3 4 5 6 7
      |#{@board[5][0]}|#{@board[5][1]}|#{@board[5][2]}|#{@board[5][3]}|#{@board[5][4]}|#{@board[5][5]}|#{@board[5][6]}|
      |#{@board[4][0]}|#{@board[4][1]}|#{@board[4][2]}|#{@board[4][3]}|#{@board[4][4]}|#{@board[4][5]}|#{@board[4][6]}|
      |#{@board[3][0]}|#{@board[3][1]}|#{@board[3][2]}|#{@board[3][3]}|#{@board[3][4]}|#{@board[3][5]}|#{@board[3][6]}|
      |#{@board[2][0]}|#{@board[2][1]}|#{@board[2][2]}|#{@board[2][3]}|#{@board[2][4]}|#{@board[2][5]}|#{@board[2][6]}|
      |#{@board[1][0]}|#{@board[1][1]}|#{@board[1][2]}|#{@board[1][3]}|#{@board[1][4]}|#{@board[1][5]}|#{@board[1][6]}|
      |#{@board[0][0]}|#{@board[0][1]}|#{@board[0][2]}|#{@board[0][3]}|#{@board[0][4]}|#{@board[0][5]}|#{@board[0][6]}|

    HEREDOC
  end

  def column_available?(input)
    @board[5][input] == ' ' ? input : nil
  end

  def make_move(input, player, row = 0)
    if @board[row][input] == ' '
      @last_move = [row, input]
      player == 1 ? @board[row][input] = 'X' : @board[row][input] = 'O'
      return
    else
      make_move(input, player, row + 1)
    end
  end

  def last_move
    @last_move
  end
end