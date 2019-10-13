# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  # setup head and tail
  attr_accessor :head, :tail

  def add(number)
    $node = Node.new(number)
    if @head.nil?
      @head = $node
    else
      @tail.next_node = $node
    end
    @tail = $node
  end

  def get(index)
    $current = @head
    while index > 0 && $current
      $current = $current.next_node
      index -= 1
    end
    $current&.value
  end
end

list = LinkedList.new
list.add(3)
list.add(5)

puts list.get(1)
