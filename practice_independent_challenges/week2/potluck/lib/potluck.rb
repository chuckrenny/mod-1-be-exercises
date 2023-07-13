class Potluck 
    attr_reader :date

    attr_accessor :dishes

    def initialize(date)
        @date = date
        @dishes = []
    end

    def add_dish(item)
        @dishes << item
    end

    def get_all_from_category(type)
        @dishes.select do |dish|
            dish.category == type
        end
    end

    def menu
        appetizers = get_all_from_category(:appetizer).map do |dish|
            dish.name
        end.sort
        
     

        entres = get_all_from_category(:entre).map do |dish|
            dish.name
        end.sort

        desserts = get_all_from_category(:dessert).map do |dish|
            dish.name
        end.sort

        {
            appetizers: appetizers,
            entres: entres,
            desserts: desserts
        }
    end

    def ratio(type)
        (get_all_from_category(type).length / dishes.length.to_f)*100
    end
end