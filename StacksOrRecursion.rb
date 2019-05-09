def tree_height(tree_as_list)
  return 0 if tree_as_list.empty?

  $l = tree_as_list.length
  $p = 0
  $s = 0

  loop do
    $s += 2**$p
    break if $s >= $l

    $p += 1
  end

  $p + 1
end

puts tree_height([2, 7, 5, 2, 6, 0, 9])
# => 3

puts tree_height([1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0])
# => 4

puts tree_height([5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0])
# => 4
