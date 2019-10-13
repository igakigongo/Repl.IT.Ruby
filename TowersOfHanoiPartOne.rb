# frozen_string_literal: true

def move(s, g)
  aux = (1..3).find { |d| d != s && d != g }
  "#{s}->#{aux} #{s}->#{g} #{aux}->#{g}"
end

puts move(1, 3)
# => 1->2 1->3 2->3

puts move(2, 3)
# => 2->1 2->3 1->3
