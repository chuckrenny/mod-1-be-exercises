require './lib/event_manager'

class Attendee < EventManager
    attr_accessor :id, :first_name, :last_name, :zipcode
    
    def initialize(id, first_name, last_name, zipcode)
        @id = id
        @first_name = first_name
        @last_name = last_name
        @zipcode = zipcode
    end

    def name
        "#{@first_name} #{@last_name}"
    end

    def display
        "#{@id}: #{name}, #{@zipcode}"
    end

    def clean_zip
        if @zipcode.nil?
            @zipcode = '00000'
        elsif @zipcode.length > 5 
            @zipcode = @zipcode[0,5]
        elsif @zipcode.length < 5
            @zipcode = @zipcode.rjust(5, '0')
        end
        @zipcode
    end

end