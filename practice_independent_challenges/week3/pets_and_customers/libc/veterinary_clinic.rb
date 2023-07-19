class VeterinaryClinic 
    attr_reader :name,
                :customers

    def initialize(name)
        @name = name
        @customers = []
    end

    def add_customer(customer)
        @customers << customer
    end

    def list_pets_by_age
        pets = @customers.map do |customer|
            customer.pets
        end.flatten.sort_by{|pet| pet.age}.reverse
    end

    def count_pets
        @customers.each_with_object(Hash.new(0)) do |customer, count_pets|
            count_pets[customer.name] = customer.pets.length
        end
    end
end