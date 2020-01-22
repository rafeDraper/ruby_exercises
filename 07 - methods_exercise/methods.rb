# frozen_string_literal: true

# Module recreation for learning pourposes

module Enumerable
  def my_each
    i = 0
    while i < length
      yield self[i]
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < length
      yield self[i], i
      i += 1
    end
  end

  def my_select
    res = []
    my_each do |el|
      res << el if yield el
    end
    res
  end

  def my_all?
    my_each do |el|
      return false if yield(el) == false
    end
    true
  end

  def my_any?
    my_each do |el|
      return true if yield(el) == true
    end
    false
  end

  def my_none?
    my_each do |el|
      return false if yield(el) == true
    end
    true
  end

  def my_count(arg = nil)
    result = []
    if block_given?
      result = my_select { |el| yield el }
    elsif !arg.nil?
      result = my_select { |el| el == arg }
    else
      return length
        end
    result.size
  end

  def my_map(proc = nil)
    result = []
    if proc
      my_each_with_index do |e, i|
        result[i] = proc.call(e)
      end
    else
      my_each_with_index do |e, i|
        result[i] = yield e
      end
    end
    result
  end

  def my_inject(*args)
    case args.length
    when 1
      if args[0].class == Symbol
        memo = self[0]
        my_each_with_index do |e, i|
          next if i == 0

          memo = memo.method(args[0]).call(e)
        end
      else
        memo = args[0]
        my_each do |e|
          memo = yield(memo, e)
        end
      end
    when 2
      memo = args[0]
      my_each do |e|
        memo = memo.method(args[1]).call(e)
      end
    else
      memo = self[0]
      my_each_with_index do |e, i|
        next if i == 0

        memo = yield(memo, e)
      end
    end
    memo
  end
end

## Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40

def multiply_els(array)
  array.my_inject { |product, power| product * power }
end
