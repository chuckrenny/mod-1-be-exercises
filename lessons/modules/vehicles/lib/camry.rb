# ./camry.rb
require './lib/engine'
require './lib/airconditionable'
class Camry
include Engine
include Airconditionable
  # def start
  #   "Engine on!"
  # end

  # def stop
  #   "Engine off!"
  # end

  def start
    "WAIIIIIIIT"
  end

  def drive
    "Back wheels go!"
  end
end
