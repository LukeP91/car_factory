def dice_roller
  results = []
  7.times { results << roll_k(20) }
  results = select_results(results)
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

dice_roller
