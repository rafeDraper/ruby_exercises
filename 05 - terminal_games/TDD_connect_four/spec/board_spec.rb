# frozen_string_literal: true

require './board'

RSpec.describe Board do
  let(:board) { Board.new }

  context 'drawing the board' do
    it 'The board is drawn' do
      expect(board.show_board).to output('hello\n').to_stdout
    end
  end
end
