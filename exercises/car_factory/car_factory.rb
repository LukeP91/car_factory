require 'pry'
class CarFactory

  class UnsupportedBrandException < StandardError; end

  SUPPORTED_BRANDS = %i{fiat lancia ford subaru}

  def initialize(name, brands: nil)
    brands = [brands].flatten
    unless brands.all? { |e| SUPPORTED_BRANDS.include?(e) }
      raise UnsupportedBrandException.new,
            "Brand not supported: '#{brands.map(&:to_s).map(&:capitalize).join(' ')}'"
    end

    @name = name
    @brands = brands
  end

  def make_car(brands = nil)
    if (brands == nil || !@brands.include?(brands) ) && @brands.size > 1 
      raise UnsupportedBrandException.new, 'Factory does not have a brand or do not support it'
    end

    brands ||= @brands.first
    Car.new(brands)
  end

  def make_cars(amount = {})
    cars = []
    
    if amount.class == Integer 
      amount.times do
        cars << Car.new(@brands.first)
        @brands.rotate!
      end
    else
      amount.keys.each do |key|
        amount[key].times do
          cars << Car.new(key)
        end
      end      
    end
    cars
  end

  def name
    "#{@name} (produces #{brands_names_array.join(', ')})"
  end

  private
  
  def brands_names_array
    @brands.map(&:to_s).map(&:capitalize)
  end
end
