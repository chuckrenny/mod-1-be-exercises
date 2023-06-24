class Werewolf
    attr_accessor :name, :location, :human, :hungry

    def initialize(name, location)
        @name = name
        @location = location
        @human = true
        @hungry = false
    end

    def human?
        @human == true
    end

    def change!
        @hungry = true
        @human = !@human
    end

    def wolf?
        @human == false
    end

    def consumes(victim)
        if @human == false
            @hungry = false
            victim.is_dead
            victim.eaten 
        end
    end
end