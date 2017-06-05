class CarFactory

  class UnsupportedBrandException < StandardError; end

  SUPPORTED_BRANDS = %i{fiat lancia ford subaru}

  def initialize(name, brands: nil)
    brands = [brands].flatten
    unless brands_supported(brands)
      raise UnsupportedBrandException.new,
            "Brand not supported: '#{brands.map(&:to_s).map(&:capitalize).join(' ')}'"
    end

    @name = name
    @brands = brands
  end

  def make_car(brands = nil)
    if brand_not_supported(brands) || default_brand(brands)
      raise UnsupportedBrandException.new, 'Factory does not have a brand or do not support it'
    end

    brands ||= @brands.first
    Car.new(brands)
  end

  def make_cars(amount = {})
    cars = []
    
    if amount.class == Integer 
      cars = make_given_amount_of_cars(amount)
    else
      cars = make_cars_for_given_hash_config(amount)    
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

  def brand_not_supported(brands)
    !@brands.include?(brands) && @brands.size > 1
  end

  def brands_supported(brands)
    brands.all? { |e| SUPPORTED_BRANDS.include?(e) }
  end
  
  def default_brand(brands)
    brands == nil && @brands.size > 1
  end

  def make_cars_for_given_hash_config(amount)
    cars = []
    amount.keys.each do |key|
      if @brands.include?(key)
        amount[key].times do
          cars << Car.new(key)
        end
      end
    end
    cars
  end

  def make_given_amount_of_cars(amount)
    cars = []
    amount.times do
      cars << Car.new(@brands.first)
      @brands.rotate!
    end
    cars
  end
end
