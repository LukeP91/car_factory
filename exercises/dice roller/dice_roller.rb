def dice_roller
  results = make_roll
  puts "Your roll is #{results.join(', ')}"
end

def roll_k(sides)
  dice_roll = Random.new
  dice_roll.rand(1..sides)
end

def select_results(results)
  lowest_roll_index = results.index(results.min)
  results.slice!(lowest_roll_index)

  highest_roll_index = results.index(results.max)
  results.slice!(highest_roll_index)

  results
end

def make_roll
  results = []
  7.times { results << roll_k(20) }
  results = select_results(results)
  return results if results_below_55(results)
  puts "Roll #{results.join(', ')} is higher than 55. Rerolling..."
  make_roll
end

def results_below_55(results)
  results.sum <= 55
end

dice_roller
