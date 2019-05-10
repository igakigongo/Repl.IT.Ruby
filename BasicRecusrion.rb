def sum(number)
  return 1 if number < 2
  number + sum(number - 1)
end

puts sum(4)
puts sum(10)
