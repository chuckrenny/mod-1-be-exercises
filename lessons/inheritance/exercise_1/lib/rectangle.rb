require './lib/shape'

class Rectangle < Shape
  # this class should have the following properties:
  # - color
  # - length
  # - width

  # attr_accessor :color, :length, :width

  def initialize(color, length, width)
    super(color, length, width)
  end

  #It should have the following methods:
  # - area (width * length)
  # - perimeter (2 * (length + width))

  # def area
  #   @length * @width
  # end
  
  # def perimeter
  #   (@length + @width) * 2
  # end

end