require 'rspec'
require_relative '../lib/building'
require_relative '../lib/apartment'
require_relative '../lib/room'

RSpec.describe Apartment do
  it 'has a building number and building name' do
    bldg = Building.new(626, "Raintree Apartment")

    expect(bldg.building_number).to be(626)
    expect(bldg.building_name).to eq("Raintree Apartment")
  end 

  it 'can add apartments' do
    bldg = Building.new("623", "Savills Apartment Building")

    apt_1 = Apartment.new
    apt_2 = Apartment.new
    apt_5 = Apartment.new

    bldg.add_apartment(apt_1)
    bldg.add_apartment(apt_2)
    bldg.add_apartment(apt_5)

    expect(bldg.list_apartments).to eq([apt_1, apt_2, apt_5])
  end

  it 'can only add 4 apartments' do
    bldg = Building.new("623", "Savills Apartment Building")

    apt_1 = Apartment.new
    apt_2 = Apartment.new
    apt_3 = Apartment.new
    apt_4 = Apartment.new
    apt_5 = Apartment.new

    bldg.add_apartment(apt_1)
    bldg.add_apartment(apt_2)
    bldg.add_apartment(apt_3)
    bldg.add_apartment(apt_4)
    bldg.add_apartment(apt_5)

    expect(bldg.list_apartments).to eq([apt_1, apt_2, apt_3, apt_4])
  end
end