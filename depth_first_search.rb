def dfs_helper(graph, node = 0, visited = [])
  return if visited.include?(node)
  visited << node
  graph[node].each { |n| dfs_helper(graph, n, visited) }
  visited
end

def depth_first_search(graph)
  dfs_helper(graph)
end

p depth_first_search({
  0 => [2],
  1 => [4],
  2 => [5, 0, 3],
  3 => [2],
  4 => [1, 5],
  5 => [4, 2],
})
# => [0, 2, 5, 4, 1, 3]
