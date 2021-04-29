require '../lib/connect_four_game'
require '../lib/connect_four_board'

board = ConnectFourBoard.new
game = ConnectFourGame.new(board)
game.play_game