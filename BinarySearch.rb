# frozen_string_literal: true

def sqrt(number)
  sqrt_recursive(number, 0, number)
end

def sqrt_recursive(number, s, e)
  m = ((e - s) / 2) + s
  x = m**2
  x == number ? m : x < number ? sqrt_recursive(number, m + 1, e) : sqrt_recursive(number, s, m - 1)
end

puts sqrt(25)
puts sqrt(7056)
