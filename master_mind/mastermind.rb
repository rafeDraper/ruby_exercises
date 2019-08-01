# frozen_string_literal: true

require_relative 'codemaker'
require_relative 'computer'
require_relative 'human'

# class for the whole game
class Mastermind
  def initialize(board, human_codemaker)
    @board = board
    if human_codemaker
      @codemaker = Human.new(board)
      @codebreaker = Computer.new(board)
    else
      @codemaker = Computer.new(board)
      @codebreaker = Human.new(board)
    end
  end

  def play
    @codemaker.generate_pattern

    until game_over?
      @codemaker.print_board
      @codebreaker.play
    end

    puts ''
    @codemaker.print_pattern
    puts ''
  end

  private

  def game_over?
    if @codebreaker.game_over?
      true
    else
      @codemaker.provide_feedback
      false
    end
  end
end
