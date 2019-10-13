def insertion_sort_1(num, arr)
  insertable = arr[-1]
  index = num - 2
  while index > -1
    break if arr[index] < insertable

    arr[index + 1] = arr[index]
    puts arr.join(' ')
    index -= 1
  end

  arr[index + 1] = insertable
  puts arr.join(' ')
end

insertion_sort_1(5, [2, 4, 6, 8, 3])
insertion_sort_1(10, [2, 3, 4, 5, 6, 7, 8, 9, 10, 1])
