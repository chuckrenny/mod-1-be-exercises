class Dock
  attr_reader :name,
              :max_rental_time,
              :rental_log


  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter) 
    @rental_log[boat] = renter
  end

  def charge(boat)
    dock_charge = {}

    person = rental_log[boat]
    hours = [boat.hours_rented, @max_rental_time].min

    dock_charge[:card_number] = person.credit_card_number
    dock_charge[:amount] = boat.price_per_hour * hours

    dock_charge
  end

  def return(boat)
    rental_log.delete(boat)
  end

  def log_hour
    @rental_log.map do |boat, person|
      boat.add_hour
    end
  end

  def revenue
    @rental_log.sum do |boat, person| 
      charge(boat)[:amount] 
    end
  end
  
end