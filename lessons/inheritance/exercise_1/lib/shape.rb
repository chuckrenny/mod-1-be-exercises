class Shape
  # This class should be a parent that creates the following properties:
  # - color
  # - width
  # - length
  attr_accessor :color, :length, :width

  def initialize(color, length, width)
    @color = color
    @length = length
    @width = width
  end

  # It should also have the following behaviors:
  # - area (width * length)
  # - perimeter (2 * (length + width))
  def area
    @length * @width
  end

  def perimeter
    (@length + @width) * 2
  end
end