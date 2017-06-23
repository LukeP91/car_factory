class Car
  class << self; attr_accessor :color_index end
  AVAILABLE_COLORS = [].freeze
  @color_index = 0

  def initialize(brand, color: nil)
    @brand = brand
    @color = color ? color : available_color
  end

  def color_name
    @color.to_s.split('_').map(&:capitalize).join(' ')
  end

  def brand
    @brand.to_s.capitalize
  end

  private

  def available_color
    return nil if AVAILABLE_COLORS.empty?
    color = AVAILABLE_COLORS[Car.color_index]
    Car.color_index = (Car.color_index + 1) % AVAILABLE_COLORS.length
    color
  end
end
