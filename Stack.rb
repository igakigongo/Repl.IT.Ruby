# frozen_string_literal: true

load 'LinkedList.rb'

# Start with your code from LinkedList challenge.
class Node
  attr_accessor :value, :next_node
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_accessor :head

  def push(number)
    # your code here
    @head = Node.new(number, @head)
  end

  def pop
    return nil if @head.nil?

    # your code here
    $value = @head.value
    @head = @head.next_node
    $value
  end
end

class Stack2
  attr_accessor :list

  def initialize
    self.list = LinkedList.new
  end

  def push(number)
    @list.add_at(0, number)
  end

  def pop
    @list.remove(0)&.value
  end
end

stack = Stack.new
stack2 = Stack.new
stack.push(3)
stack.push(5)
puts stack.pop

stack2.push(3)
stack2.push(5)
puts stack2.pop
# => 5

stack.push(2)
stack.push(7)
puts stack.pop
stack2.push(2)
stack2.push(7)
puts stack2.pop
# => 7

puts stack.pop
puts stack2.pop
# => 2

puts stack.pop
puts stack2.pop
# => 3
