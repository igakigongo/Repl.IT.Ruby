# frozen_string_literal: true

def bfs(graph)
  # write your code here
  visited = []
  queue = [graph.keys.first]

  until queue.empty?
    c = queue.shift
    visited << c unless visited.include? c

    graph[c].each do |x|
      queue << x && visited << x unless visited.include? x
    end
  end
  visited
end

p bfs(
  0 => [2],
  1 => [4],
  2 => [5, 0, 3],
  3 => [2],
  4 => [1, 5],
  5 => [4, 2]
)
# => [0, 2, 5, 3, 4, 1]
