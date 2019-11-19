# frozen_string_literal: true

require_relative './node.rb'

# binary search tree
class BinarySearchTree
  attr_reader :root
  def initialize(array = Array.new(8) { rand(1...100) })
    array = Array(array).sort.uniq
    @root = build_tree(array)
  end

  def build_tree(array)
    return nil if array.empty?

    middle = array.length / 2
    root_node = Node.new(array[middle])
    root_node.left = build_tree(array[0...middle])
    root_node.right = build_tree(array[middle + 1..-1])
    root_node
  end

  def insert(value, node = root)
    case value <=> node.data
    when 1
      node.right ? insert(value, node.right) : node.right = Node.new(value)
    when -1
      node.left ? insert(value, node.left) : node.left = Node.new(value)
    end
  end

  def delete(value, node = root)
    return node if value.nil?

    case value <=> node.data
    when 1
      node.right = delete(value, node.right)
    when -1
      node.left = delete(value, node.left)
    end
    if node.leaf?
      return nil
    elsif node.single_parent?
      node.left || node.right
    end
  end

  def find(value, node = root)
    return node if node.data == value

    case value <=> node.data
    when 1
      find(value, node.right)
    when -1
      find(value, node.left)
    end
  end

  def levelorder_rec(current = root, queue = [], result = [], &block)
    return if current.nil?

    block_given? ? block.call(current) : result << current.data
    queue << current.left if current.left
    queue << current.right if current.right
    current = queue.shift
    levelorder_rec(current, queue, result, &block)
    result unless block_given?
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    if node.right
      pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false)
    end
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    if node.left
      pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true)
    end
  end
end

tree = BinarySearchTree.new([1, 2, 3, 5, 15, 10])
tree.insert(234)
puts tree.pretty_print
puts tree.find(5)
