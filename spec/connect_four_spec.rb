# frozen_string_literal: true

require_relative '../lib/connect_four_game'
require_relative '../lib/connect_four_board'

describe ConnectFourGame do

  subject(:game) { described_class.new(board) }
  let(:board) { ConnectFourBoard.new }

  describe '#play_game' do
    # This method does not need testing, but the calls inside it do.

    describe 'print_board' do
      it 'sends a message to ConnectFourBoard class' do
        expect(board).to receive(:print_board)
        board.print_board
      end
    end

    describe '#verify_input' do
      it 'returns value if between 1 and 7' do
        input = 3
        verified_input = game.verify_input(input)
        expect(verified_input).to eq(3)
      end

      it 'returns nil if not between 1 and 7' do
        input = 8
        verified_input = game.verify_input(input)
        expect(verified_input).to eq(nil)
      end

      it 'checks column is available' do
        input = 0
        available = board.column_available?(input)
        expect(available).to eq(input)
      end
    end

    describe '#make_move' do
      context 'it changes the boat based on column and player' do
        it 'changes column 0 to X (Player 1)' do
          column = 0 
          player = 1
          board_array = board.instance_variable_get(:@board)
          make_move = board.make_move(column, player)
          expect(board_array[0][0]).to eq('X')
          make_move
        end

        it 'changes column 2 to O (Player 2)' do
          column = 2
          player = 2
          board_array = board.instance_variable_get(:@board)
          make_move = board.make_move(column, player)
          expect(board_array[0][2]).to eq('O')
          make_move
        end
      end
    end

    describe '#full?' do
      context 'it checks whether the board is full or not' do
        it 'is not full' do
          expect(board).not_to be_full
        end
      end
    end
  end
end
