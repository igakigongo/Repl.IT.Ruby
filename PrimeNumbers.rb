require 'set'

@set_of_primes = nil

def create_sieve(upto)
  # p 'primes initialization called'
  primes= Hash.new(false)
  a = (2..upto).map { |i| {  k: i, v:true } }.to_a
  a.each_with_index do |ele, index|
    key = ele[:k]
    start = index + key
    # p "#{key} -> #{index} -> #{start}"
    modified = false
    while start < a.length
      a[start][:v] = false unless (a[start][:v]).equal?false
      modified = true unless modified
      # p "next: #{a[start]}"
      start += key
    end

    break unless modified
  end
  a.select { |ele| ele[:v] }.map { |ele| ele[:k]}
end


def number_of_primes(arr)
  # call create sieve only once
  @set_of_primes ||= create_sieve(10000).to_set
  count = arr.count { |ele| @set_of_primes.member?(ele)}
end

puts number_of_primes([2, 3, 5, 6, 9])
# => 3

puts number_of_primes([121, 17, 21, 29, 11, 341, 407, 19, 119, 352])
# => 4

puts number_of_primes([7, 6, 7, 3, 77, 14, 28, 35, 42])
# => 3