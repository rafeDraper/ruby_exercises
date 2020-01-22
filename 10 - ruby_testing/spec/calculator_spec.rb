# frozen_string_literal: true

require './lib/calculator'

RSpec.describe Calculator do
  describe '#add' do
    it 'returns the sum of two numbers' do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end
    # add this
    it 'returns the sum of more than two numbers' do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end

  describe '#multiply' do
    it 'returns the multiplication of two numbers' do
      calculator = Calculator.new
      expect(calculator.multiply(2, 5)).to eql(10)
    end

    it 'returns the multiplication of two or more numbers' do
      calculator = Calculator.new
      expect(calculator.multiply(2, 5, 4)).to eql(40)
    end
  end

  describe '#substract' do
    it 'returns the substraction of two numbers' do
      calculator = Calculator.new
      expect(calculator.substract(10, 8)).to eql(2)
    end

    it 'returns the substraction of two or more numbers' do
      calculator = Calculator.new
      expect(calculator.substract(10, 2, 4)).to eql(4)
    end
  end

  describe '#divide' do
    it 'returns the division of two numbers' do
      calculator = Calculator.new
      expect(calculator.divide(10, 5)).to eql(2)
    end

    it 'returns the division of two or more numbers' do
      calculator = Calculator.new
      expect(calculator.divide(10, 5, 2)).to eql(1)
    end
  end
end
