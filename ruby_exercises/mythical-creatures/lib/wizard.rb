class Wizard
    attr_accessor :name, :bearded, :rested

    def initialize(name, bearded: true)
        @name = name
        @bearded = bearded
        @rested = 0
    end

    def bearded?
        @bearded
    end

    def incantation(command)
        "sudo #{command}"
    end

    def rested?
        @rested < 3
    end

    def cast
        @rested += 1
        "MAGIC MISSILE!"
    end
end
