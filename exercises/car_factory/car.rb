class Car
  def initialize(brand, color: nil)
    @brand = brand
    @color = color
  end

  def color_name
    @color.to_s.split('_').map(&:capitalize).join(' ')
  end
end
