class Board
  attr_accessor :complete_board

  def initialize
    @complete_board = Array.new(6) { Array.new(7) }
  end
end