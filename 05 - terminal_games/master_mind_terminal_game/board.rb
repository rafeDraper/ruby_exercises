# frozen_string_literal: true

# first class for the board game
class Board
  attr_reader :pegs, :decoding_board, :feedback_board, :holes, :rows
  attr_accessor :pattern

  def initialize
    @pegs = 6
    @rows = 14
    @holes = 4
    @decoding_board = Array.new(@rows) { Array.new(@holes) }
    @feedback_board = Array.new(@rows) { [] }
    @pattern = Array.new(@holes)
  end
end
