def bfs(graph)
  # write your code here
  visited = []
  queue = [graph.keys.first]

  while !queue.empty?
    c = queue.shift
    visited << c if !visited.include? c

    graph[c].each do |x|
      queue << x and visited << x if !visited.include? x
    end
  end
  visited
end

p bfs({
  0 => [2],
  1 => [4],
  2 => [5, 0, 3],
  3 => [2],
  4 => [1, 5],
  5 => [4, 2],
})
# => [0, 2, 5, 3, 4, 1]
