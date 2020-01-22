# generate a function with recursion that returns a merge sorted array

def merge_sort(array)
  return array if array.length == 1

  cut_it = (array.length / 2) - 1
  left = merge_sort(array[0..cut_it])
  right = merge_sort(array[cut_it + 1..-1])
  merge(left, right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    result << if left[0] < right[0]
                left.shift
              else
                right.shift
              end
  end
  result += left.length.zero? ? right[0..-1] : left[0..-1]
  result
end

p merge_sort([1, 33, 37, 2, 2, 43, 19, 7, 90])