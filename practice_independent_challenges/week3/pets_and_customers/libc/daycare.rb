class Daycare
    attr_reader :name,
              :customers,
              :feeding_prices

    def initialize(name, feeding_prices)
        @name = name
        @customers = []
        @feeding_prices = feeding_prices
    end

    def add_customers(customer)
        @customers << customer
    end

    def customer_by_id(id)
        @customers.find do |customer|
          customer.id == id
        end
    end

    def unfed_pets
        pets = @customers.map do |customer|
            customer.pets
        end.flatten.find_all do |pet|
            pet.fed? == false
        end
    end

    def feed_and_charge_unfed_pets
        unfed_pets.each do |pet|
            pet.feed
            owner = @customers.find do |customer|
                customer.pets.include?(pet)
            end
            owner.charge(@feeding_prices[pet.type])
        end
    end
end