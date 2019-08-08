def merge_sort(array1, array2)
  out = []
  until array1.empty? && array2.empty?
    e1, e2 = array1.first, array2.first
    if e1.nil? || e2.nil?
      out << (e1.nil? ? array2.shift : array1.shift)
    else
      out << (e1 < e2 ? array1.shift : array2.shift)
    end
  end
  out
end

p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
# => [1, 2, 3, 4, 6, 8, 9, 11]
