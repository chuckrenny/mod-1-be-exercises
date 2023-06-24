class Dragon
    attr_accessor :name, :color, :rider

    def initialize(name, color, rider)
        @name = name
        @color = color
        @rider = rider
        @hungry = 0
    end

    def hungry?
        @hungry < 3
    end

    def eat
        @hungry += 1
    end
end


