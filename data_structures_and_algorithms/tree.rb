# frozen_string_literal: true

require './node.rb'

# binary search tree
class Tree
  def initialize
    @root = nil
  end

  def build_tree(array = Array.new(8) { rand(1...10) })
    array.sort.uniq.each do |number|
      root = Node.new(number)
      if @root.nil?
        @root = root
      else
        insert(@root, number)
      end
    end
  end

  def insert(node, value)
    case value <=> node.value
    when 1
      node.right ? insert(node.right, value) : node.right = Node.new(value)
    when -1
      node.left ? insert(node.left, value) : node.left =  Node.new(value)
    end
  end

  def find(value)
    
  end
end

test = Tree.new
p test.build_tree([1, 3, 6, 31, 8, 2, 1, 45])
p test.find(31)