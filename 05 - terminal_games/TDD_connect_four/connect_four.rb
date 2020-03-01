require_relative '/board'

# game class
class ConnectFour
  def initialize
    @board = Board.new
    @player1 = player1
    @player2 = player2
  end

  def player_turn(column_number)
    # player choose a column to drop a peg
    comlpete_board[column_number]
  end
end