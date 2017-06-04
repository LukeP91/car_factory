class CarPark
  attr_reader :capacity, :cars

  def initialize(capacity)
    @capacity = capacity
    @cars = []
  end

  def places_left
    @capacity - @cars.size
  end

  def receive(cars)
    cars = [cars]
    cars.flatten!
    cars.each do |car|
      @cars << car if (places_left > 0)
    end
  end
end
