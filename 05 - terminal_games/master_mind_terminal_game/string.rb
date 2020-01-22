# frozen_string_literal: true

# string coloring
class String
  def colorize(color)
    "\e[48;5;#{color}m#{self}\e[0m"
  end

  def color(color)
    case color
    when :yellow
      colorize(11)
    when :red
      colorize(1)
    when :blue
      colorize(57)
    when :orange
      colorize(172)
    when :violet
      colorize(5)
    when :green
      colorize(83)
    when :white
      colorize(15)
    # black
    else
      colorize(256)
    end
  end
end

