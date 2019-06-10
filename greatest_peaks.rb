# Peaks By Sets - Get greatest peaks using
class PeaksBySets
  attr_reader :map, :max_x, :max_y, :sets, :valid_point

  def initialize(map)
    @map = map
    @max_x = map.first.length - 1
    @max_y = map.length - 1
    @valid_point = proc { |peak|
      peak[:x].between?(0, @max_x) && peak[:y].between?(0, @max_y)
    }
    @sets = []
  end

  private

  def connect(peak, max_peak)
    # p "max_peak not found" -> add it to set - or simply join it to target set
    sets << [max_peak] unless sets.any? { |s| s.any? { |e| e == max_peak } }

    set_one = sets.delete_at(index_of_set_containing(peak))
    set_two = sets.delete_at(index_of_set_containing(max_peak))

    sets << (set_one | set_two) # merge back into @sets
  end

  def index_of_set_containing(peak)
    i = -1
    sets.each_with_index do |item, index|
      i = index if item.any? { |subset| subset == peak }
    end
    i
  end

  def noisy_neighbors(x_cord, y_cord)
    arr = possible_neighbors(x_cord, y_cord).map do |ele|
      { x: ele[0], y: ele[1] }
    end
    arr.select(&valid_point).each do |k|
      k[:v] = map[k[:y]][k[:x]]
    end
  end

  def possible_neighbors(x_cord, y_cord)
    arr = [] << [x_cord, y_cord - 1] << [x_cord + 1, y_cord]
    arr << [x_cord, y_cord + 1] << [x_cord - 1, y_cord]
    arr
  end

  public

  # pass in true to get
  def min_and_max
    [sets.min_by(&:length).length, sets.max_by(&:length).length]
  end

  def run
    map.each_with_index do |x_value, col|
      x_value.each_with_index do |y_value, row|
        peak = { x: row, y: col, v: y_value }
        sets << [peak] if sets.none? { |s| s.any? { |e| e == peak } }
        max_peak = noisy_neighbors(row, col).max_by { |k| k[:v] }
        connect(peak, max_peak) if max_peak[:v] > peak[:v]
      end
    end
    self
  end
end

def greatest_peaks(map)
  PeaksBySets.new(map).run.min_and_max
end

p greatest_peaks([[9, 8, 5], [5, 6, 3], [8, 4, 1]])
# => [3, 6]

p greatest_peaks([[8, 12], [9, 3]])
# => [1, 3]
