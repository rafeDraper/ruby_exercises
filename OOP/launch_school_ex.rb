# frozen_string_literal: true

# RD practice exercise to create OOP
class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(value)
    @current_speed += value
    puts "whoa, slow down, you are going at #{value} kmh!"
  end

  def current_speed
    puts "You are now going at #{@current_speed} mph."
  end

  def brake(value)
    @current_speed -= value
  end

  def shut_down
    @current_speed = 0
  end

  def spray_paint(value)
    self.color = value
    puts "whoa, now your car is #{value}"
  end

  def self.gas_per_km(distance, liters)
    puts "#{distance / liters} km per liter of gas"
  end

  def to_s
    "My car is color:#{color} and it is a:#{@model}, from:#{year}"
  end
end
# examples of usage:
# my_car = MyCar.new(2015, 'black', 'Ibiza')
# puts my_car

# Test work
class BaseballPlayer
  attr_accessor :hits, :at_bats, :walks
  def initialize(hits, walks, at_bats)
    @hits = hits
    @walks = walks
    @at_bats = at_bats
  end

  def batting_average
    result = hits / at_bats
    puts result.to_f
  end

  def on_base_percentage
    result = (hits + walks) / at_bats
    puts result.to_f
  end
end

# examples of usage:
# rafa = BaseballPlayer.new(30, 10, 2)
# rafa.batting_average
# rafa.on_base_percentage
