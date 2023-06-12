class Person
    attr_reader :name, :age, :weight, :pet

    def initialize(name, age, weight)
        @name = name
        @age = age
        @weight = weight
        @pet = "Dog"
    end

    def have_birthday
        @age+=1
    end
end