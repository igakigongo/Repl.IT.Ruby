require 'set'

@set = nil

def create_sieve(upto)
  a = (2..upto).map { |i| true }

  a.each_with_index do |ele, index|
    next if !ele

    start = index * 2 + 2
    modified = false
    while start < a.length
      a[start] = false if a[start]
      modified = true unless modified
      start += index + 2
    end

    break unless modified
  end
  a
end

def number_of_primes(arr)
  # call create sieve only once
  @set = create_sieve(30) unless @set
  count = arr.count { |ele| !@set[ele - 2].nil? && @set[ele - 2] }
end

puts number_of_primes([2, 3, 5, 6, 9])
# => 3

puts number_of_primes([121, 17, 21, 29, 11, 341, 407, 19, 119, 352])
# => 4

puts number_of_primes([7, 6, 7, 3, 77, 14, 28, 35, 42])
# => 3
