# ./jeep.rb
require './lib/engine'
require './lib/airconditionable'
class Jeep
include Engine
include Airconditionable
  # def start
  #   "Engine on!"
  # end

  # def stop
  #   "Engine off!"
  # end

  def drive
    "All wheels go!"
  end
end
