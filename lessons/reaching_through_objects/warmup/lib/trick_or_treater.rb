class TrickOrTreater 
    attr_accessor :outfit, :bag

    def initialize (outfit)
        @outfit = outfit
        @bag = Bag.new
    end

    def dressed_up_as
        @outfit.style
    end

    def has_candy?
        !@bag.empty? 
    end

    def candy_count
        @bag.count
    end

    def eat
        @bag.remove
    end
 
end