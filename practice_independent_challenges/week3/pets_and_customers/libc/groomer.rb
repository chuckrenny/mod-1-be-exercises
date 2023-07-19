class Groomer
    attr_reader :name, 
                :customers

    def initialize(name)
        @name = name
        @customers = []
    end

    def add_customer(customer)
        @customers << customer
    end

    def find_outstanding_balances
        balance = Hash.new
        @customers.each do |customer|
            balance[customer.name] = customer.outstanding_balance if customer.outstanding_balance > 0
        end
        balance
    end

    # def pet_count
    #     pet_type = Hash.new
    #     @customers.each do |customer|
    #         customer.pets.each do |pet|
    #             if pet_type[pet.type] 
    #                 pet_type[pet.type] +=1
    #             else
    #                 pet_type[pet.type] = 1
    #             end
    #         end
    #     end
    #     pet_type
    # end

    def pet_count
        @customers.each_with_object(Hash.new(0)) do |customer, pet_type|
          customer.pets.each do |pet|
            pet_type[pet.type] += 1
          end
        end
    end
end