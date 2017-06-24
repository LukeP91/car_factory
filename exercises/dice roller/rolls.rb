require_relative 'dice_roll'

class Rolls
  MAX_ROLLS_SUM = 55

  def initialize
    @k20 = DiceRoll.new(20)
    @k30 = DiceRoll.new(30)
    @additional_roll_result = @k30.additional_roll
    @results = []
  end

  def make_rolls
    7.times { @results << @k20.roll }
    discard_results
    if results_below_max_sum
      @results << @k20.make_extra_roll(@additional_roll_result)
      return @results
    end
    puts "Roll #{@results.join(', ')} is higher than 55. Rerolling..."
    @resuilts = []
    make_rolls
  end

  private

  def discard_results
    return select_lowest_results if @additional_roll_result[:second_roll] == 1
    select_results
  end

  def select_results
    lowest_roll_index = @results.index(@results.min)
    @results.slice!(lowest_roll_index)

    highest_roll_index = @results.index(@results.max)
    @results.slice!(highest_roll_index)
  end

  def select_lowest_results
    lowest_roll_index = @results.index(@results.min)
    @results.slice!(lowest_roll_index)

    second_lowest_roll_index = @results.index(@results.min)
    @results.slice!(second_lowest_roll_index)
  end

  def results_below_max_sum
    @results.sum <= MAX_ROLLS_SUM
  end
end
