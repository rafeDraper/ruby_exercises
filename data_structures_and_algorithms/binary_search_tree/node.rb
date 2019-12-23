# frozen_string_literal: true

# main node class for binary search tree construction
class Node
  include Comparable
  attr_accessor :parent, :left, :right
  attr_reader :data
  def initialize(data)
    @data = data
    @left = left
    @right = right
  end

  def <=>(other)
    data <=> other.data
  end

  def leaf?
    left.nil? && right.nil?
  end

  def single_parent?
    left.nil? != right.nil?
  end
end
