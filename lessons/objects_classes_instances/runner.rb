require './person'

person_1 = Person.new("David", 23, 160)

person_2 = Person.new("Michelle", 30, 120)

p person_1.have_birthday 
require 'pry'; binding.pry