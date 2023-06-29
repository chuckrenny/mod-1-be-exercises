require 'csv'

class EventManager
  def initialize(filename = "./data/event_attendees.csv")
    @filename = filename
    @attendees = []
  end

  def load_attendees
    CSV.foreach(@filename, headers: true) do |row|
      id = row['ID']
      first_name = row['first_Name']
      last_name = row['last_Name']
      zipcode = row['Zipcode']

      attendee = Attendee.new(id, first_name, last_name, zipcode)
      @attendees << attendee
    end
  end

  def display_attendees
    @attendees.each do |attendee|
      puts attendee.display
    end
  end
end



# Iteration 0: Loading a File
# puts "EventManager initialized."

# lines = File.readlines "./data/event_attendees.csv"

# lines.each_with_index do |line,index|
#   next if index == 0
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end



# Iteration 1: Parsing with CSV (MY SOLUTION)
# # ./lib/event_manager.rb
# require 'csv'
# puts "EventManager initialized."

# filename = './data/event_attendees.csv'

# lines = CSV.read(filename, headers: true) # returns an array of CSV::Row objects, rathern than array of strings

# lines.each do |line|
#   name = line[2]
#   p name
# end



# Iteration 1: Parsing with CSV (Tutorial)
# require "csv"
# puts "EventManager initialized."

# contents = CSV.open "./data/event_attendees.csv", headers: true
# contents.each do |row|
#   name = row[2]
#   puts name
# end



# Iteration 1: Parsing with CSV (Accessing Columns by the Variable Names)
# require "csv"
# puts "EventManager initialized."

# contents = CSV.open "./data/event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
#   name = row[:first_name]
#   zipcode = row[:zipcode]
#   puts "#{name} #{zipcode}"
# end


# Iteration 2: Cleaning up our Zip Codes
# require "csv"
# puts "EventManager initialized."

# contents = CSV.open "./data/event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
#   name = row[:first_name]
#   zipcode = row[:zipcode]

#   # if the zip code is exactly five digits, assume that it is ok
#   # if the zip code is more than 5 digits, truncate it to the first 5 digits
#   # if the zip code is less than 5 digits, add zeros to the front until it becomes five digits
#   if zipcode.nil?
#     zipcode = "00000"
#   elsif zipcode.length < 5
#     zipcode = zipcode.rjust 5, "0"
#   elsif zipcode.length > 5
#     zipcode = zipcode[0,5]
#   end

#   puts "#{name} #{zipcode}"
#  end



 # Iteration 2: Cleaning up our Zip Codes (Moving Clean Zip Codes to a Method)
#  require 'csv'

# def clean_zipcode(zipcode)
#   if zipcode.nil?
#     "00000"
#   elsif zipcode.length < 5
#     zipcode.rjust(5,"0")
#   elsif zipcode.length > 5
#     zipcode[0,5]
#   else
#     zipcode
#   end
  
#   # or 
#   # zipcode.to_s.rjust(5,"0")[0,5]
# end

# puts "EventManager initialized."

# contents = CSV.open './data/event_attendees.csv', headers: true, header_converters: :symbol

# contents.each do |row|
#   name = row[:first_name]

#   zipcode = clean_zipcode(row[:zipcode])

#   puts "#{name} #{zipcode}"
# end