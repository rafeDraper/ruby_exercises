# frozen_string_literal: true

require './methods'

describe Enumerable, '#my_select' do
  context 'selects pointed element' do
    it 'selects even numbers' do
      expect([1, 2, 3].my_select(&:even?)).to eql([2])
    end
  end
end

# class MethodsTest < Minitest::Test
#   @@test_array = [1, 2, 3]
#   @@proc = proc { |e| e**2 }
#
#   def test_select_method
#     assert_equal [2], @@test_array.my_select(&:even?)
#   end
#
#   def test_my_all_method
#     assert_equal @@test_array.all? { |num| num  > 1 }, @@test_array.my_all? { |num| num  > 1 }
#   end
#
#   def test_my_none_method
#     assert_equal @@test_array.none? { |num| num > 8 }, @@test_array.my_none? { |num| num > 8 }
#   end
#
#   def test_my_count_method_no_args
#     assert_equal @@test_array.count, @@test_array.my_count
#   end
#
#   def test_my_count_method_one_arg
#     assert_equal @@test_array.count(5), @@test_array.my_count(5)
#   end
#
#   def test_my_count_method_block
#     assert_equal @@test_array.count { |num| num < 5 }, @@test_array.my_count { |num| num < 5 }
#   end
#
#   def test_my_map_method
#     assert_equal @@test_array.map { |num| num + 1 }, @@test_array.my_map { |num| num + 1 }
#   end
#
#   def test_my_map_method_with_a_proc
#     assert_equal [1, 4, 9], @@test_array.my_map(@@proc)
#   end
#
#   def test_my_inject_method
#     assert_equal @@test_array.inject(:+), @@test_array.my_inject(:+)
#   end
#
#   def test_multiply_els
#     assert_equal 6, multiply_els(@@test_array)
#   end
# end
