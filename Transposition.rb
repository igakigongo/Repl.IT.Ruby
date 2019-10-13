# frozen_string_literal: true

require 'benchmark'

# find next n character from a given index in a string
def find_next_n(string, index)
  while index < string.length
    return index if string[index] == 'n'

    index += 1
  end
end

# swap - the basic operation in this problem
def swap_chars(s, left, right)
  $temp = s[left]
  s[left] = s[right]
  s[right] = $temp
end

# execute
def transpose(string)
  index = 0
  len = string.length
  while index < len - 1
    if string[index] == 'g' && string[index + 1] == 'g'
      n_at = find_next_n(string, index + 2)
      swap_chars(string, index, n_at) unless n_at.nil?
    elsif string[index] == 'g' && string[index + 1] == 'n'
      swap_chars(string, index, index + 1)
    end
    index += 1
  end
  string
end

def transpose_with_gsub(string)
  # your code here
  string.gsub!('gn', 'ng') while string.include?('gn')

  string
end

n = 100_000
Benchmark.bm do |x|
  x.report('gsub') { n.times { transpose_with_gsub('rignadingdiggn!') } }
  x.report('pers') { n.times { transpose('rignadingdiggn!') } }
end

puts transpose('he was searchign on Bign for signign kigns')
# => he was searching on Bing for singing kings

puts transpose('rignadingdiggn!')
# => ringadingdingg!

puts transpose('gngngnnggnngggnnn')
# => nnnnnnnnngggggggg
