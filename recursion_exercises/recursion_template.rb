# frozen_string_literal: true

# fibonacci secuence
def self.fibonacci(number)
  result = []
  number.times do
    result << if result.length > 1
                result[-2] + result[-1]
              else
                1
              end
  end
  result[number - 1]
end

# fibonacci sequence with recursion
def self.fibonacci_rec(number)
  if number > 1
    fibonacci_rec(number - 1) + fibonacci_rec(number - 2)
  else
    number
  end
end

p fibonacci(10)
