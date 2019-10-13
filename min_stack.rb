# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_accessor :head, :min_value, :min_prev

  def initialize
    @min_prev = @min_value = -1
  end

  def push(num)
    @min_prev = num && @min_value = num if @head.nil?
    if num < @min_value && !@head.nil?
      @min_prev = @min_value
      @min_value = num
    end
    @head = Node.new(num, @head)
  end

  def pop
    @head.next_node.nil? ? @min_prev = nil : @min_value = @min_prev
    temp = @head&.value
    @head = @head.next_node
    temp
  end

  def min
    @min_value
  end
end

stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.min
# => 3

stack.pop
stack.push(7)
puts stack.min
# => 3

stack.push(2)
puts stack.min
# => 2

stack.pop
puts stack.min
# => 3
