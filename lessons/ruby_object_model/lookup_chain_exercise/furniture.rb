require "./wood_things"
require './furniture_module'

class Furniture < WoodThings
  include FurnitureModule

  def soft        #5  #6
    "superclass"  #5  #6
  end             #5  #6

end
