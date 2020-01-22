# frozen_string_literal: true

# this thing is for MiniTest
class Rsort
  def self.bubble_sort(array)
    repeat = array.length
    loop do
      change = false
      (repeat - 1).times do |number|
        if array[number] > array[number + 1]
          array[number], array[number + 1] = array[number + 1], array[number]
          change = true
        end
      end
      break unless change
    end
    array
  end

  def self.bubble_sort_by(array)
    array.length.times do |first|
      array.length.times do |second|
        if yield(array[second], array[first]) > 0
          array[first], array[second] = array[second], array[first]
        end
      end
    end
    array
  end
end
