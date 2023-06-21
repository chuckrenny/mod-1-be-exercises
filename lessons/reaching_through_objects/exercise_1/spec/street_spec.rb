require 'rspec'
require_relative '../lib/street'
require_relative '../lib/building'
require_relative '../lib/apartment'
require_relative '../lib/room'

RSpec.describe Street do
  it 'has a street name' do
    adlington = Street.new("Adlington Road")

    expect(adlington.name).to eq("Adlington Road")
  end 

  it 'can add buildings on the street' do
    adlington = Street.new("Adlington Road")
    bldg = Building.new(626, "Raintree Apartments")

    adlington.add_building(bldg)
    expect(adlington.owned_buildings).to eq([bldg])
  end 

  it 'can list buildings alphabetically' do
    adlington = Street.new("Adlington Road")
    zebra = Building.new("123", "Zebra Apartments")
    bldg = Building.new(626, "Savills Apartment Building")
    
    adlington.add_building(bldg)
    adlington.add_building(zebra)
    adlington.buildings

    expect(adlington.buildings).to eq(["Savills Apartment Building", "Zebra Apartments"])
  end

  it 'can state the number of available apartments' do
    apt_1 = Apartment.new
    apt_2 = Apartment.new
    apt_3 = Apartment.new
    apt_4 = Apartment.new
    apt_5 = Apartment.new

    adlington = Street.new("Adlington Road")
    savills = Building.new(623, "Savills Apartment Building")

    savills.add_apartment(apt_1)
    savills.add_apartment(apt_2)
    savills.add_apartment(apt_3)
    savills.add_apartment(apt_4)
    savills.add_apartment(apt_5)

    apt_1.rent 
    apt_3.rent

    adlington.add_building(savills)
    expect(adlington.number_of_available_apartments).to eq(2)
  end 

end
