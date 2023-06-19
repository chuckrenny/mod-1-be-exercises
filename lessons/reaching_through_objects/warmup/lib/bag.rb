class Bag
   # attr_reader 
    attr_accessor :candies

    def initialize ()
        @candies = []
    end

    def empty?
        @candies.empty? 
    end

    def count
        @candies.size 
    end

    def add_candy(candy)
        @candies << candy
    end

    def contains?(kind)
        @contains = false
        # p @candies
        @candies.each do |candy|
            # candy needs .type as the array is 
            # [#<Candy:0x0000000108067698 @type="Lindt chocolate">]
            @contains = true if candy.type == kind
        end

        @contains
    end      

    def <<(candy)
        @candies << candy
    end

    def remove
        @candies.pop()
    end
      
end

