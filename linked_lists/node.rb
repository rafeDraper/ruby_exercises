# frozen_string_literal: true

# class
class Node
  attr_accessor :next_node, :value

  def initialize(value)
    @next_node = nil
    @value = value
  end
end