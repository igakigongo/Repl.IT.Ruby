# frozen_string_literal: true

@closing = [']', ')', '}']
@opening = ['[', '(', '{']

def balanced_brackets?(string)
  stack = []

  string.each_char do |c|
    stack << c && next if @opening.include?(c)
    if @closing.include?(c)
      x = stack.pop
      return false if @opening.index(x) != @closing.index(c)
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
