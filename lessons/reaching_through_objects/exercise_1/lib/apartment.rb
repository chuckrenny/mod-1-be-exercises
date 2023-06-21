require_relative '../lib/room'

class Apartment
    attr_accessor :rooms

    def initialize
      @rented = false
      @rooms = []
    end

    def is_rented?
      @rented
    end

    def rent
      @rented = true
    end

    def add_room(room_name)
      @rooms << room_name
    end
    
    def list_rooms_by_name_alphabetically
      @room = @rooms.sort_by { |room| room.name }.map(&:name)
    end
end