# frozen_string_literal: true
require_relative 'node'
# class
class LinkedList
  def initalize
    @head = nil
    @tail = nil
  end

  def append(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
      @tail.next_node = nil
    end
  end

  def prepend(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    res = 0
    actual_node = @head
    until actual_node.nil?
      res += 1
      actual_node = actual_node.next_node
    end
    res
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    i = 0
    nil if index > size
    actual_node = @head
    until actual_node.nil?
      if i == index
        return actual_node
      else
        i += 1
        actual_node = actual_node.next_node
      end
    end
  end

  def pop
    actual_node = @head
    actual_node = actual_node.next_node until actual_node.next_node == @tail
    @tail = actual_node
    @tail.next_node = nil
  end

  def contains?(value)
    actual_node = @head
    until actual_node.nil?
      return true if actual_node.value == value

      actual_node = actual_node.next_node
    end
    false
  end

  def find(value)
    i = 0
    actual_node = @head
    until actual_node.nil?
      return i if actual_node.value == value

      actual_node = actual_node.next_node
      i += 1
    end
    nil
  end

  def to_s
    res = ''
    actual_node = @head
    until actual_node.nil?
      res += "( #{actual_node.value} ) -> "
      actual_node = actual_node.next_node
    end
    res + 'nil'
  end

  def insert_at(node, index)
    return if index < 0 || index >= size

    if index == 0
      preppend(node)
    elsif index == size - 1
      append(node)
    else
      prev_node = at(index-1)
      actual_node = at(index)
      prev_node.next_node = node
      node.next_node = actual_node
    end
  end

  def remove_at(index)
    return if index < 0 || index >= size

    if index == 0
      @head = @head.next_node
    elsif index == size - 1
      pop
    else
      prev_node = at(index-1)
      next_node = at(index+1)
      prev_node.next_node = next_node
    end
  end
end

# examples: 

test = Node.new(10)
exam = LinkedList.new
exam.append(test)
exam.append(Node.new('diez'))
exam.append(Node.new('zehn'))
exam.prepend(Node.new(11))
exam.prepend(Node.new('once'))
exam.prepend(Node.new('elf'))
