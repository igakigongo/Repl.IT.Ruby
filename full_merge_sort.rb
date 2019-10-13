# frozen_string_literal: true

def merge_sort(array1, array2)
  out = []
  until array1.empty? && array2.empty?
    e1 = array1.first
    e2 = array2.first
    out << if e1.nil? || e2.nil?
             (e1.nil? ? array2.shift : array1.shift)
           else
             (e1.to_i <= e2.to_i ? array1.shift : array2.shift)
           end
  end
  out
end

def recursive_merge(array)
  return array if array.length == 1

  # split the array
  mid = array.length / 2

  a1 = recursive_merge(array[0...mid])
  a2 = recursive_merge(array[mid..-1])
  merge_sort(a1, a2)
end

def full_merge_sort(array)
  recursive_merge(array).map { |ele| ele.split(' ').last }
end

example_array = ['0 ab', '6 cd', '0 ef', '6 gh', '4 ij', '0 ab', '6 cd', '0 ef', '6 gh', '0 ij', '4 that', '3 be', '0 to', '1 be', '5 question', '1 or', '2 not', '4 is', '2 to', '4 the']
p full_merge_sort(example_array)
# => ["ab", "ef", "ab", "ef", "ij", "to", "be", "or", "not", "to", "be", "ij", "that", "is", "the", "question", "cd", "gh", "cd", "gh"]
