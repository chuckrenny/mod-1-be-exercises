require "./chair_module"
require "./furniture"

class Chair < Furniture
  include ChairModule

  def initialize
    @motto = "I'm a chair!"
  end

  def chair_type
    short = "variable" #1 #2  #3  #4  #5  #6 
    puts short            #2  #3  #4  #5  #6 
    puts soft          #1
  end

  def short
    "method"
  end

  def soft      #3  #4  #5  #6 
    "class"     #3  #4  #5  #6 
  end           #3  #4  #5  #6 

end

Chair.new.chair_type
# require 'pry';binding.pry

#    pp:ObjectMixin   Kernel      FurnitureModule     ChairModule
#                \   /                     |            |
# BasicObject -> Object -> WoodThings -> Furniture -> Chair