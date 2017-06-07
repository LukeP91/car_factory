def dice_roller
  dice_roll = Random.new
  puts "Your roll is #{dice_roll.rand(1..20)}"
end

dice_roller