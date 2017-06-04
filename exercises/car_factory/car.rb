class Car
  AVAILABLE_COLORS = []

  def initialize(brand, color: nil)
    @brand = brand
    if color.nil?
      @color = AVAILABLE_COLORS.first
      AVAILABLE_COLORS.rotate!
    else
      @color = color
    end
  end

  def color_name
    @color.to_s.split('_').map(&:capitalize).join(' ')
  end

  def brand
    @brand.to_s.capitalize
  end
end
