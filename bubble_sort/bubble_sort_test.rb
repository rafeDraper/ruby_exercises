require 'minitest/autorun'
require_relative 'bubble_sort'

# Class for testing purposes
class BubbleSortTest < Minitest::Test
    def test_basic
        assert_equal [1, 2], Rsort.bubble_sort([2, 1])
    end
    
    def test_three_digits
        assert_equal [1, 2, 3], Rsort.bubble_sort([2, 3, 1])
    end

    def test_long_arrays
        assert_equal [0, 2, 2, 3, 4, 78], Rsort.bubble_sort([4, 3, 78, 2, 0, 2])
    end

    def test_sorting_by
        assert_equal ['hi', 'hey', 'hello'], Rsort.bubble_sort_by(['hi', 'hello', 'hey']) {|left,right| left.length - right.length}
    end
end