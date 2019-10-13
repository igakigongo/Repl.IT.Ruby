# frozen_string_literal: true

def balanced_brackets?(string)
  stack = []
  string.each_char do |c|
    case c
    when '[', '(', '{'
      stack.push(c)
    when ']'
      x = stack.pop
      return false if x != '['
    when ')'
      x = stack.pop
      return false if x != '('
    when '}'
      x = stack.pop
      return false if x != '{'
    end
  end
  stack.empty?
end

puts balanced_brackets?('(hello)[world]')
# => true

puts balanced_brackets?('([)]')
# => false

puts balanced_brackets?('[({}{}{})([])]')
# => true
