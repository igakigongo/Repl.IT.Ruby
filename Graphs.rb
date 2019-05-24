def path(hash, key, visited)
  visited.push(key)
  return visited if key.equal? 4
  path(hash, hash[key].first, visited)
end

def graph(hash_graph)
  return path(hash_graph, hash_graph.keys.first, [])
end

hash = {
  0 => [2],
  1 => [4],
  2 => [5, 0, 3],
  3 => [2],
  4 => [1, 5],
  5 => [4, 2],
}

hash_two = {
  0 => [1, 2],
  1 => [2, 0],
  2 => [3, 0, 1, 4, 5],
  3 => [4, 2],
  4 => [3, 2],
  5 => [2],
}

p graph(hash)
# => [0, 2, 5, 4]

p graph(hash_two)
# => [0, 1, 2, 3, 4]
