load "Stack.rb"

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

def tree_height_with_stack(tree_as_list)
  return 0 if tree_as_list.empty?

  $stack = Stack2.new
  $start = 0
  $p = 0
  while $start < tree_as_list.length
    $take = 2**$p
    $count = 0

    $innerStack = Stack2.new
    while $count < $take
      $innerStack.push(tree_as_list.shift)
      $count += 1
    end
    $stack.push($innerStack)

    $p += 1
    $start += 1
  end

  # let inspect these stacks - top most value must be the last value in the array
  puts "Top most value: #{$stack.list.head.value.list.head.value}"
  $p
end

puts "Stacks Implementation (Tree Height): #{tree_height_with_stack([2, 7, 5, 2, 6, 0, 9])}"
puts "Loops Implementation: #{tree_height([2, 7, 5, 2, 6, 0, 9])}"
# => 3

puts "Stacks Implementation (Tree Height): #{tree_height_with_stack([1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0])}"
puts tree_height([1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0])
# => 4

puts "Stacks Implementation (Tree Height): #{tree_height_with_stack([5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0])}"
puts tree_height([5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0])
# => 4
