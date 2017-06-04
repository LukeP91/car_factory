class CarFactory

  class UnsupportedBrandException < StandardError; end

  SUPPORTED_BRANDS = %i{Fiat Lancia Ford Subaru}

  def initialize(name, brands: nil)
    brands = [brands].flatten
    unless brands.all? { |e| SUPPORTED_BRANDS.include?(e.capitalize) }
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
end
