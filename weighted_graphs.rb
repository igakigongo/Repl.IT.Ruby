# frozen_string_literal: true

# bfs - Breadth First Search
def towns_to_destination(matrix:, start: 0, destination:)
  visited = {}
  visited[start] = true
  queue = [[start]]

  return 0 if start == destination

  # towns after start
  until visited.key?(destination)
    last = queue[-1]
    queue << []
    last.each do |p|
      matrix[p].each_with_index do |ele, index|
        if ele != start && !visited.key?(index)
          queue[-1] << index
          visited[index] = true
        end
      end
    end
  end
  queue.length - 1
end

def weighted_graphs(matrix)
  last = matrix.length - 1
  (0..last).map { |i| towns_to_destination(matrix: matrix, destination: i) }
end

p weighted_graphs([
                    [0, 0, 1, 3, 0, 0],
                    [0, 0, 0, 5, 0, 0],
                    [1, 0, 0, 2, 1, 4],
                    [3, 5, 2, 0, 7, 0],
                    [0, 0, 1, 7, 0, 2],
                    [0, 0, 4, 0, 2, 0]
                  ])
# => [0, 2, 1, 1, 2, 2]

p weighted_graphs([
                    [0, 3, 6, 0, 0, 9, 4],
                    [3, 0, 4, 1, 0, 0, 0],
                    [6, 4, 0, 3, 5, 4, 1],
                    [0, 1, 3, 0, 2, 0, 0],
                    [0, 0, 5, 2, 0, 3, 0],
                    [9, 0, 4, 0, 3, 0, 3],
                    [4, 0, 1, 0, 0, 3, 0]
                  ])
# expected: [0, 1, 1, 3, 2, 2, 3, 3, 4, 1]
#     got: [0, 1, 1, 2, 2, 1, 1]
