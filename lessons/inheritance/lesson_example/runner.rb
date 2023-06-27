require './lib/ceo'
require './lib/manager'
require './lib/intern'
require './lib/manager'
require './lib/ceo'

ali = Ceo.new(15, 20, "Daniel", 3349)
ben = Manager.new(10, "Ben", 2009)
chris = Intern.new(5, "Intern", 9999)

# require "pry"; binding.pry

# Ali, Ben, and Chris all need names and IDs in the system. 
# Where can they get those?

puts ali.bonus
puts ben.name
puts chris.id