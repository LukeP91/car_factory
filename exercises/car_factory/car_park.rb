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

  def brands
    brands = []
    @cars.each do |car|
      brands << car.brand
    end
    brands.uniq!
  end

  def brands_stats
    brands_stats = {}
    @cars.each do |car|
      if brands_stats[car.brand].nil?
        brands_stats[car.brand] = 1
      else 
        brands_stats[car.brand] = brands_stats[car.brand]++1
      end
    end   
    brands_stats 
  end
end
