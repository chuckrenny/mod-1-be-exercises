require './lib/dog'

max = Dog.new("Max")
puts max.woof

## Describe what each part of the code above did -
# `max` => created a new instance of the 'Dog' class named max while passing in
# the string "Max"
# `Dog` => Dog refers to the class object
# `.woof` => Method inside of Dog class called on the max object

# puts Dog.woof
# 'Woof!'
## Is there any difference between the two methods above? (max.woof and Dog.woof)?

## Un-comment the line of code below, does it work? Why or why not?
#Dog.bark
# No as we did not specify the object we're calling it on.
# It should be max.bark

