@sets = []

@max_x ||= 0
@max_y ||= 0

def connect(peak, max_peak)

  # p "max_peak not found" -> add it to set - or simply join it to target set
  @sets << [max_peak] if !@sets.any? { |s| s.any? { |e| e == max_peak } }

  #  get index of peak and max_peak respectively - import their contents into local as well
  local = []
  @sets.delete_at(find_index_of_set_containing(peak)).each { |e| local << e }
  @sets.delete_at(find_index_of_set_containing(max_peak)).each { |e| local << e }

  # merge back into @sets
  @sets << local
end

# does not mutate state
def find_index_of_set_containing(peak)
  i = -1
  @sets.each_with_index { |item, index|
    i = index if item.any? { |subset| subset == peak }
  }
  i
end

def noisy_neighbors(x, y, map)
  valid_peak = lambda { |peak| peak[:x].between?(0, @max_x) && peak[:y].between?(0, @max_y) }
  [
    { x: x, y: y - 1 },
    { x: x + 1, y: y },
    { x: x, y: y + 1 },
    { x: x - 1, y: y }
  ].select(&valid_peak).each { |coord|
    coord[:v] = map[coord[:y]][coord[:x]] #note - this reading seems like it reverses x and y but hell no, it does not
  }
end

def greatest_peaks(map)
  @sets = []
  @max_x = map.first.length - 1
  @max_y = map.length - 1

  map.each_with_index { |x_value, col|
    x_value.each_with_index { |y_value, row|
      peak = { x: row, y: col, v: y_value }
      @sets << [peak] if !@sets.any? { |s| s.any? { |e| e == peak } }
      max_peak = noisy_neighbors(row, col, map).max_by { |neighbor| neighbor[:v] }
      connect(peak, max_peak) if max_peak[:v] > peak[:v]
    }
  }
  [@sets.min_by { |s| s.length }.length, @sets.max_by { |s| s.length }.length]
end

p greatest_peaks(
  [
    [9, 8, 5],
    [5, 6, 3],
    [8, 4, 1],
  ]
)
# => [3, 6]

p greatest_peaks(
  [
    [8, 12],
    [9, 3],
  ]
)
# => [1, 3]
