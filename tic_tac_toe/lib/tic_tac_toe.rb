# frozen_string_literal: true

require_relative 'tic_tac_toe/version'

module TicTacToe
  class Error < StandardError; end
  # Your code goes here...
end

require_relative './tic_tac_toe/cell.rb'
require_relative './tic_tac_toe/core_extensions.rb'
lib_path = __dir__
Dir[lib_path + '/tic_tac_toe/**/*.rb'].each { |file| require file }
