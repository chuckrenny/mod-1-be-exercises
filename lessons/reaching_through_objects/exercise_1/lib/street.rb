class Street
    attr_reader :name  

    attr_accessor :owned_buildings, :apartment

    def initialize(name)
        @name = name 
        @owned_buildings = []
    end

    def add_building(bldg)
        @owned_buildings << bldg
    end

    def buildings
        @building_names = @owned_buildings.map do |building| 
            building.instance_variable_get(:@building_name) 
        end

        @building_names.sort
        # @owned_buildings.map(&:building_name).sort
    end 

    def number_of_available_apartments
        @owned_buildings.sum do |building|
            building.apartments.count do |apt|
                !apt.is_rented?
            end
        end
    end
end