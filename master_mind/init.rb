# frozen_string_literal: true

require_relative 'board'
require_relative 'mastermind'

puts ''
puts '*******   Welcome to MasterMind!   *******'
puts ''
print 'Please select the codemaker: 1. Computer  2. Human: '
human_codemaker = gets.chomp
human_codemaker = human_codemaker != '1'
puts ''
board = Board.new
game = Mastermind.new(board, human_codemaker)
game.play
