class Ogre
    attr_accessor :name, :home, :swings, :encounter_counter

    def initialize(name, home = 'Swamp')
        @name = name
        @home = home
        @swings = 0
        @encounter_counter = 0
    end

    def encounter(human)
        human.encounter_counter += 1
        @encounter_counter += 1
        if human.encounter_counter % 3 == 0
            @swings += 1
            human.notice
            human.knocked_out = true if @swings % 2 == 0
        end
    end

    def swing_at(human)
        @swings += 1
        human.knocked_out = (@swings%2 == 0)
    end

    def apologize(human)
        human.knocked_out = false
    end

end

class Human
    attr_accessor :name, :encounter_counter, :noticed, :knocked_out

    def initialize
        @name = 'Jane'
        @encounter_counter = 0
        @noticed = false
        @knocked_out = false
    end

    def notice
        @noticed = true
    end

    def notices_ogre?
        @noticed
    end

    def knocked_out?
        @knocked_out
    end
end
