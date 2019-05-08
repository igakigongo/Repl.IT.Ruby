# Start with your code from last challenge.
class Node
  attr_accessor :next_node, :value

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :count, :head, :tail

  def initialize
    @count = 0
  end

  def add(value)
    $node = Node.new(value)
    if @head.nil?
      @head = $node
    else
      @tail.next_node = $node
    end
    @count += 1
    @tail = $node
  end

  def add_at(index, value)
    # if index is between 0 and count of current nodes - then we can always insert into the node
    if !index.between?(0, count)
      raise Exception, "Index is out of bounds exception: can insert between #{0} and #{count}"
    end

    # insert at head - special condition
    if index == 0 && self.head.nil?
      return self.add(value)
    elsif index == 0 && !self.head.nil?
      self.count += 1
      return self.head = Node.new(value, self.head)
    end

    $new = Node.new(value)
    $prev = self.head
    while index > 1 && $prev
      $prev = $prev.next_node
      index -= 1
    end

    self.count += 1
    $temp = $prev.next_node
    $new.next_node = $temp
    $prev.next_node = $new
  end

  def get(index)
    $current = @head
    while index > 0 && $current
      $current = $current.next_node
      index -= 1
    end
    $current&.value
  end

  def remove(index)
    if index == 0
      $temp = @head.next_node
      @head = $temp
    else
      $prev = @head
      while index > 1 && $prev
        $prev = $prev.next_node
        index -= 1
      end

      $temp = $prev.next_node.next_node
      $prev.next_node = $temp
    end
  end

  def print_list()
    node = self.head
    output = ""

    until node.next_node.nil?
      output += "#{node.value}, "
      node = node.next_node
    end
    output += "#{node.value}"
  end
end

list = LinkedList.new

list.add_at(0, 12)
list.add_at(0, 10)
list.add(3)
list.add(5)
list.add_at(1, 11)

# puts list.print_list()

list.add_at(0, 13)

# puts list.print_list()

#puts list.get(0)
#puts list.get(1)
#puts list.get(2)
# => 11

#puts list.get(3)
# => 5

#list.remove(1)
