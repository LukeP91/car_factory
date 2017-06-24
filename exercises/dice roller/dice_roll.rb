class DiceRoll
  def initialize(sides)
    @sides = sides
    @rand = Random.new
  end

  def roll
    @rand.rand(1..@sides)
  end

  def additional_roll
    first_roll = roll
    return { first_roll: first_roll, second_roll: 0 } if first_roll > 7
    second_roll = roll
    { first_roll: first_roll, second_roll: second_roll }
  end

  def make_extra_roll(additional_roll_result)
    return 25 if additional_roll_result[:second_roll] >= 24
    roll
  end
end
