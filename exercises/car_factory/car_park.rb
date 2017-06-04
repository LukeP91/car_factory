class CarPark
  attr_reader :capacity, :cars

  def initialize(capacity)
    @capacity = capacity
    @cars = []
  end

  def receive(cars)
    @cars << cars
  end
end
