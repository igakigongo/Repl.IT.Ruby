def sum_left (array, index, sum)
  k = index*2 + 1
  return k > array.length ? sum: sum + sum_left(array, k, array[index])
end

def leftmost_nodes_sum(array)
  # your code here
  sum_left(array, 0, 0)
end

puts leftmost_nodes_sum([2, 7, 5, 2, 6, 0, 9])
# => 11