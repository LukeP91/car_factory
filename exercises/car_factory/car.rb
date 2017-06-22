class Car
  AVAILABLE_COLORS = []

  def initialize(brand, color: nil)
    @brand = brand
    @color = color ? color : get_available_color
  end

  def color_name
    @color.to_s.split('_').map(&:capitalize).join(' ')
  end

  def brand
    @brand.to_s.capitalize
  end

  private

  def get_available_color
    color = AVAILABLE_COLORS.first
    AVAILABLE_COLORS.rotate!
    color
  end
end
