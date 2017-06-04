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
  
  def retrieve(number_of_cars)
    @cars.pop(number_of_cars)
  end
end
