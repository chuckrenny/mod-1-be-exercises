require 'rspec'
require_relative '../lib/apartment'
# require_relative '../lib/room'

RSpec.describe Apartment do
  it 'is initially false for rent' do
    apartment = Apartment.new
    expect(apartment.is_rented?).to be(false)
  end 

  it 'has no rooms when it is empty' do
    apartment = Apartment.new
    expect(apartment.rooms).to eq([])
  end

  it 'is currently rented?' do
    apartment = Apartment.new
    
    expect(apartment.is_rented?).to be(false)
  end

  it 'can be rented' do
    apartment = Apartment.new
    apartment.rent

    expect(apartment.is_rented?).to be(true)
  end

  it 'can add up to 4 rooms' do
    apartment = Apartment.new
    bathroom = Room.new("bathroom")
    laundry = Room.new("laundry")
    kitchen = Room.new("kitchen")
    bedroom = Room.new("bedroom")
    
    apartment.add_room(bathroom)
    apartment.add_room(laundry)
    apartment.add_room(kitchen)
    apartment.add_room(bedroom)

    expect(apartment.rooms).to eq([bathroom, laundry, kitchen, bedroom])
  end

  it 'can sort the rooms alphabetically' do
    apartment = Apartment.new
    bathroom = Room.new("bathroom")
    laundry = Room.new("laundry")
    kitchen = Room.new("kitchen")
    bedroom = Room.new("bedroom")
    
    apartment.add_room(bathroom)
    apartment.add_room(laundry)
    apartment.add_room(kitchen)
    apartment.add_room(bedroom)

    expect(apartment.list_rooms_by_name_alphabetically).to eq(["bathroom", "bedroom", "kitchen", "laundry"])
  end 
end