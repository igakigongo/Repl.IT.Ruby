require "benchmark"

# find next n character from a given index in a string
def find_next_n(string, index)
  while index < string.length
    return index if string[index] == "n"
    index += 1
  end
end

# swap - the basic operation in this problem
def swap_chars(s, left, right)
  $temp = s[left]
  s[left] = s[right]
  s[right] = $temp
end

def transpose(string)
  index = 0
  len = string.length
  while index < len - 1
    if string[index] == "g" and string[index + 1] == "g"
      n_at = find_next_n(string, index + 2)
      swap_chars(string, index, n_at) if !n_at.nil?
    elsif string[index] == "g" and string[index + 1] == "n"
      swap_chars(string, index, index + 1)
    end
    index += 1
  end
  string
end

def transpose_with_gsub(string)
  # your code here
  while string.include?("gn")
    string.gsub!("gn", "ng")
  end

  string
end

n = 100000
Benchmark.bm do |x|
  x.report("gsub") { n.times do transpose_with_gsub("rignadingdiggn!") end }
  x.report("personal") { n.times do transpose("rignadingdiggn!") end }
end

puts transpose("he was searchign on Bign for signign kigns")
# => he was searching on Bing for singing kings

puts transpose("rignadingdiggn!")
# => ringadingdingg!

puts transpose("gngngnnggnngggnnn")
# => nnnnnnnnngggggggg
