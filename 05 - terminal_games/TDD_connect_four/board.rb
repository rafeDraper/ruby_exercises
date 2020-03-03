# frozen_string_literal: true

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7, '_') }
  end

  def show_board
    board = ''
    @board.each do |board_row|
      board_row.each do |board_space|
        board += "|#{board_space}|"
      end
      board += "\n"
    end
    puts '|1||2||3||4||5||6||7|'
    puts board
    puts '_____________________'
    puts '----CONNECT  FOUR----'
  end
end
