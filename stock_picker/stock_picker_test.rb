# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'stock_picker'

class Stocktest < Minitest::Test
  def test_basic
    assert_equal [1,8], Stocks.stock_picker([17,1,3,6,9,8,6,1,10])
  end
end
