class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

#root must be a node - it can be nullable
#data must be the value to insert into the node
def insert_bst(root, data)
  if root.nil?
    root = Node.new(data) 
    return root
  end

  parent = nil
  current = root

  while !current.nil?
    parent = current
    current = data <= current.data ? current.left : current.right
  end

  if data <= parent.data
    parent.left = Node.new(data)
  else
    parent.right = Node.new(data)
  end

  root
end

def binary_search_tree(array)
  root = nil
  while !array.empty?
    root = insert_bst(root, array.shift)
  end
  pre_order(root)
end

def pre_order(node)
  node.nil? ? "" : "#{node.data} #{pre_order(node.left)}#{pre_order(node.right)}"
end

a = [8, 3, 10, 1, 6, 14, 4, 7, 13]
puts binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
# => "8 3 1 6 4 7 10 14 13"