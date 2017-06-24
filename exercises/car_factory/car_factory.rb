require 'pry'
class CarFactory
  class UnsupportedBrandException < StandardError; end

  SUPPORTED_BRANDS = %i(fiat lancia ford subaru).freeze

  def initialize(name, brands: nil)
    brands = [brands].flatten
    if !brands_supported?(brands)
      raise UnsupportedBrandException.new,
            "Brand not supported: '#{brands.map(&:to_s).map(&:capitalize).join(' ')}'"
    end

    @name = name
    @brands = brands
  end

  def make_car(brands = nil)
    if !brand_available?(brands) && !can_use_default_brand?(brands)
      raise UnsupportedBrandException.new, 'Factory does not have a brand or do not support it'
    end

    brands ||= @brands.first
    Car.new(brands)
  end

  def make_cars(amount = {})
    amount.is_a?(Integer) ? make_given_amount_of_cars(amount) : make_cars_for_given_hash_config(amount)
  end

  def name
    "#{@name} (produces #{brands_names_array.join(', ')})"
  end

  private

  def brands_names_array
    @brands.map(&:to_s).map(&:capitalize)
  end

  def brand_available?(brands)
    @brands.size > 1 && @brands.include?(brands)
  end

  def brands_supported?(brands)
    (brands - SUPPORTED_BRANDS).empty?
  end

  def can_use_default_brand?(brands)
    @brands.size == 1 && (@brands.include?(brands) || brands.nil?)
  end

  def make_cars_for_given_hash_config(config_hash)
    config_hash.collect do |brand, amount|
      Array.new(amount) { Car.new(brand) } if @brands.include?(brand)
    end.flatten.compact
  end

  def make_given_amount_of_cars(amount)
    # version with map
    amount.times.collect{ |i| Car.new(@brands[i % @brands.length]) }
    # version with passing block to an Array.new
    # Array.new(amount) { |i| Car.new(@brands[i % @brands.length]) }
  end
end
