# frozen_string_literal: true

require_relative '../lib/connect_four_game'
require_relative '../lib/connect_four_board'

describe ConnectFourGame do

  subject(:game) { described_class.new(board) }
  let(:board) { instance_double('Board') }

  describe '#play_game' do
    # This method does not need testing, but the calls inside it do.
  
    describe 'print_board' do
      it 'sends a message to ConnectFourBoard class' do
        expect(board).to receive(:print_board)
        game.play_game
      end
    end

    describe '#verify_input' do

      before do
        allow(board).to receive(:column_available?).and_return(:input)
      end

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
    end
  end
end

# Game needs to have a method which first displays an empty board with some sort of grid. This grid comes from the board class.
# It then needs to ask you which column to put the piece in. 
# It verifies the column exists
# and that column is not full. 
# Once in, it needs to check if this is a winning move.
# If it is a winning move, the game needs to end with a winning message.
# If it isn't a winning move, the other player's turn starts from step 2.
