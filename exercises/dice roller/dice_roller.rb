require 'pry'
def dice_roller
  results = make_roll
  puts "Your randomly generated set: #{results.join(', ')}. Are you happy?"
  answer = gets.chop
  dice_roller if answer != "YES!"
end

def make_roll
  results = []
  additional_roll_result = additional_roll
  7.times { results << roll_k(20) }
  results = discard_results(results, additional_roll_result)
  if results_below_55(results)
    results << make_extra_roll(additional_roll_result)
    return results
  end
  puts "Roll #{results.join(', ')} is higher than 55. Rerolling..."
  make_roll
end

def roll_k(sides)
  dice_roll = Random.new
  dice_roll.rand(1..sides)
end

def results_below_55(results)
  results.sum <= 55
end

def discard_results(results, additional_roll_result)
  return select_lowest_results(results) if additional_roll_result[:second_roll] == 1
  select_results(results)
end

def select_results(results)
  lowest_roll_index = results.index(results.min)
  results.slice!(lowest_roll_index)

  highest_roll_index = results.index(results.max)
  results.slice!(highest_roll_index)

  results
end

def select_lowest_results(results)
  lowest_roll_index = results.index(results.min)
  results.slice!(lowest_roll_index)

  second_lowest_roll_index = results.index(results.min)
  results.slice!(second_lowest_roll_index)

  results
end

def additional_roll
  first_roll = roll_k(30)
  return { first_roll: first_roll, second_roll: 0 } if first_roll > 7
  second_roll = roll_k(30)
  { first_roll: first_roll, second_roll: second_roll }
end

def make_extra_roll(additional_roll_result)
  return 25 if additional_roll_result[:second_roll] >= 24
  roll_k(20)
end

dice_roller
