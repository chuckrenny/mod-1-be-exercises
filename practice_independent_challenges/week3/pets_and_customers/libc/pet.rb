class Pet
    attr_reader :name,
                :type,
                :age,
                :fed

    def initialize(data)
        @name = data[:name]
        @type = data[:type]
        @age = data[:age]
        @fed = false
    end

    def fed?
        @fed
    end

    def feed
        @fed = true
    end
end