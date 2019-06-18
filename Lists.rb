# frozen_string_literal: true

# primary data type - a node in a graph/tree/linkedlist
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# primary data type - linked list implementation
# internal Data Structure is a Node
class LinkedList
  attr_accessor :head, :tail

  def add(number)
    node = Node.new(number)
    if @head.nil?
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  def get(index)
    current = @head
    while index.positive? && current
      current = current.next_node
      index -= 1
    end
    current&.value
  end
end
