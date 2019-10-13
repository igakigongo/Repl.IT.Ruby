# frozen_string_literal: true

def hanoi_steps(number_of_discs)
  tower(number_of_discs, 1, 3, 2)
end

def tower(n, from, to, aux)
  if n == 1
    puts "#{from}->#{to}"
    return
  end

  tower(n - 1, from, aux, to)
  puts "#{from}->#{to}"
  tower(n - 1, aux, to, from)
end

# hanoi_steps(2)
# hanoi_steps(3)
# hanoi_steps(4)
