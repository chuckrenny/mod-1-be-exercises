class Centaur
    attr_accessor :name, :breed, :cranky, :standing, :laying, :sick

    def initialize(name, breed)
        @name = name
        @breed = breed
        @cranky = 0
        @standing = true
        @laying = false
        @sick = false
    end

    def shoot
        if @cranky < 3 && @standing
            @cranky += 1
            'Twang!!!'
        else
            'NO!'
        end
    end

    def run
        if @standing
            @cranky += 1
            'Clop clop clop clop!'
        else
            'NO!'
        end
    end

    def cranky?
        @cranky >= 3
    end

    def standing?
        @standing
    end

    def laying?
        @laying
    end

    def sleep
        if @standing
            "NO!"
        elsif @laying
            @cranky = 0
        end
    end

    def lay_down
        @standing = false
        @laying = true
    end

    def stand_up
        @standing = true
        @laying = false
    end

    def drink_potion
        if @standing && @cranky >= 3
            @cranky = 0 
        elsif @cranky <= 3
            @sick = true
        end
    end

end