# frozen_string_literal: true

# board class for hangman game
class Board
  def initialize
    @instructions = instructions
    @hd_graphics = hd_graphics(7)
  end

  def instructions
    puts '************* HANG-MAN GAME **************'
    puts '------------------------------------------'
    puts '* The computer will select a random word *'
    puts '------------------------------------------'
    puts '   *** your duty: guess the letter ***    '
    puts '------------------------------------------'
  end

  def hd_graphics(count)
    case count
    when 6
      puts '  _____     '
      puts ' |     |    '
      puts ' |          '
      puts ' |          '
      puts ' |          '
      puts ' ~~~~~~~~~~~'
    when 5
      puts '  _____     '
      puts ' |     |    '
      puts ' |     O    '
      puts ' |          '
      puts ' |          '
      puts ' ~~~~~~~~~~~'
    when 4
      puts '  _____     '
      puts ' |     |    '
      puts ' |     O    '
      puts ' |     |    '
      puts ' |          '
      puts ' ~~~~~~~~~~~'
    when 3
      puts '  _____     '
      puts ' |     |    '
      puts ' |     O    '
      puts ' |    /|    '
      puts ' |          '
      puts ' ~~~~~~~~~~~'
    when 2
      puts '  _____     '
      puts ' |     |    '
      puts ' |     O    '
      puts ' |    /|\\  '
      puts ' |          '
      puts ' ~~~~~~~~~~~'
    when 1
      puts '  _____     '
      puts ' |     |    '
      puts ' |     O    '
      puts ' |    /|\\  '
      puts ' |      \\  '
      puts ' ~~~~~~~~~~~'
    when 0
      puts '  _____     '
      puts ' |     |  R.I.P. '
      puts ' |     O    '
      puts ' |    /|\\  '
      puts ' |    / \\  '
      puts ' ~~~~~~~~~~~'
    end
  end
end
