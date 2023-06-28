require './lib/shape'

class Circle < Shape
    attr_accessor :radius

    def initialize(color, radius)
        super(color, nil, nil)
        @radius = radius
    end

    def circumference
        2 * Math::PI * @radius
    end

    def area
        2 * Math::PI * (@radius**2)
    end
end