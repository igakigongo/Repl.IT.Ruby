def balanced_brackets?(string)
  stack = []
  string.each_char { |c|
    case c
    when "[", "(", "{"
      stack.push(c)
    when "]"
      x = stack.pop()
      return false if x != "["
    when ")"
      x = stack.pop()
      return false if x != "("
    when "}"
      x = stack.pop()
      return false if x != "{"
    end
  }
  stack.empty?
end

puts balanced_brackets?("(hello)[world]")
# => true

puts balanced_brackets?("([)]")
# => false

puts balanced_brackets?("[({}{}{})([])]")
# => true
