class Direwolf
    attr_accessor :name, :home, :size, :starks_to_protect, :hunts_white_walkers

    def initialize(name, home = 'Beyond the Wall', size = 'Massive')
        @name = name
        @home = home
        @size = size
        @starks_to_protect = []
        @hunts_white_walkers = true
    end

    def protects(stark)
        if stark.location == @home && @starks_to_protect.count < 2
            @hunts_white_walkers = false
            stark.safe = true
            @starks_to_protect << stark 
        end
    end

    def hunts_white_walkers?
        @hunts_white_walkers
    end

    def leaves(stark)
        @hunts_white_walkers = true
        stark.safe = false
        @starks_to_protect.delete(stark)
        stark
    end
end

class Stark
    attr_accessor :name, :location, :safe, :house_words

    def initialize(name, location = 'Winterfell')
        @name = name
        @location = location
        @safe = false
        @house_words = 'Winter is Coming'
    end

    def safe?
        @safe
    end
end