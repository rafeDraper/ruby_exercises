require_relative './board'

# game class
class ConnectFour
  attr_accessor :player_one, :player_two
  attr_reader :opportunities

  def initialize
    @board = Board.new
    @player_one = player_one
    @player_two = player_two
    @opportunities = 10
  end

  def player_pick(row_number)
    # player choose a column to drop a peg
    board << row_number
  end

  def check_board
  end
  
  def play_game
  end
end
