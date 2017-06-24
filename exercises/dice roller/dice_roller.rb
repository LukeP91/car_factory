require_relative 'rolls'

def dice_roller
  results = Rolls.new.make_rolls
  puts "Your randomly generated set: #{results.join(', ')}. Are you happy?"
  answer = gets.chop
  dice_roller if answer != "YES!"
end

dice_roller
