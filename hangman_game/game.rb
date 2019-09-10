# frozen_string_literal: true

require_relative 'board.rb'
require 'yaml'

# board class for hangman game
class Game
  def initialize
    @board = Board.new
    @select_word = word.downcase
    @secret_word = Array.new(@select_word.length, '_')
    @player_input = []
    @attempts = 6
    @game_status = 'play'
  end

  def word
    file = File.readlines('5desk.txt')
    file.select { |word| (5..8).cover?(word.strip.length) }.sample.strip
  end

  def player_input
    letter = ''
    while letter == ''
      puts "word to guess: #{@secret_word}"
      puts 'Please enter one character'
      guess = gets.chomp.downcase
      if guess == 'save'
        save_game
        @game_status = 'saved'
        break
      end
      next unless ('a'..'z').include? guess

      if @player_input.include? guess
        puts "You have tried that letter already. Your tries: #{@player_input}"
        next
      end
      letter = guess
    end
    return if @game_status == 'saved'

    puts "You have #{@attempts} left"
    @player_input << letter
    userinput_vs_hidenword(letter)
  end

  def userinput_vs_hidenword(letter)
    letter_found = false
    @select_word.each_char.with_index do |ltr, indx|
      if ltr == letter
        @secret_word[indx] = letter
        letter_found = true
      end
    end
    @attempts -= 1 unless letter_found
    right_answer(letter_found)
  end

  def right_answer(letter_found)
    puts letter_found ? 'damn right!' : 'ehm nope, try again'
  end

  def player_win?
    true if !@secret_word.include?('_') || @player_input.include?(@select_word)
  end

  def final_screen
    puts "You won! #{@secret_word}" if @game_status == 'won'
    if @game_status == 'lost'
      puts @board.hd_graphics(0)
      puts "The word was: #{@select_word}"
      puts 'you lost'
    end
    puts 'Game saved' if @game_status == 'saved'
  end

  def save_game
    now = Time.new
    File.open("../saves#{@secret_word}-#{now.day}_-#{now.hour}.yml", 'w'){ |file| file.puts YAML::dump(self)}
  end

  def round
    while @game_status == 'play'
      @board.hd_graphics(@attempts)
      player_input
      @game_status = 'won' if player_win?
      @game_status = 'lost' if @attempts.zero?
    end
    final_screen
  end
end

one = Game.new
one.round
