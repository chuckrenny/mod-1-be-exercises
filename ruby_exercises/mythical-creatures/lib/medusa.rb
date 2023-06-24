class Medusa
    attr_accessor :name, :statues

    def initialize(name)
        @name = name
        @statues = []
    end

    def stare(victim)
        victim.turned_to_stone
        if @statues.count != 3
            @statues << victim 
        elsif @statues.count == 3
            @statues.pop
            @statues << victim
        end
    end
end

class Person
    attr_accessor :name, :stoned
    
    def initialize(name)
        @name = name
        @stoned = false
    end

    def stoned?
        @stoned 
    end

    def turned_to_stone
        @stoned = true
    end
end