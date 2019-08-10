def sliding_maximum(k, array, n = 0, res = [])
  return res if k > array.length
  res << array[n...k].max
  sliding_maximum(k + 1, array, n + 1, res)
end

def sliding_maximum_2(k, array)
  a, i, limit = [], 0, (array.length - k + 1)

  while i < limit
    a << array[i...(i + k)].max && i += 1
  end
  a
end

p sliding_maximum_2(3, [1, 3, 5, 7, 9, 2])
