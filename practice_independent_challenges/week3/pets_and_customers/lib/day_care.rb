class DayCare
  attr_reader :name,
              :customers,
              :feeding_prices

  def initialize(name, feeding_prices)
    @name = name
    @customers = []
    @feeding_prices = feeding_prices
  end

  def add_customer(customer)
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
    end.flatten
    pets.find_all do |pet|
      !pet.fed?
    end
  end
end
