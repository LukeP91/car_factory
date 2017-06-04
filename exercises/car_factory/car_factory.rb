class CarFactory

  class UnsupportedBrandException < StandardError; end

  SUPPORTED_BRANDS = %i{Fiat Lancia Ford Subaru}

  def initialize(name, brands: nil)
    unless SUPPORTED_BRANDS.include?(brands.capitalize)
      raise UnsupportedBrandException.new,
            "Brand not supported: '#{brands.to_s.capitalize}'"
    end

    @name = name
    @brands = brands
  end

  def make_car
    Car.new(@brands)
  end
end
