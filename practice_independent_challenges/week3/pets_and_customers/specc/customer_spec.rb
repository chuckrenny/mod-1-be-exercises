require './libc/customer'
require './libc/pet'
require 'rspec'

RSpec.describe do
    before do
        @joel = Customer.new("Joel", 2)
        @samson = Pet.new({name: "Samson", type: :dog, age: 3})
        @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})    
    end

    it 'can initialize' do
        expect(@joel).to be_a(Customer)
    end

    it 'can access the attributes' do
        expect(@joel.name).to eq("Joel")
        expect(@joel.id).to eq(2)
        expect(@joel.pets).to eq([])
        expect(@joel.outstanding_balance).to eq(0)
    end

    it 'can adopt Pets' do
        @joel.adopt(@samson)
        @joel.adopt(@lucy)

        expect(@joel.pets).to eq([@samson, @lucy])
    end

    it 'can charge to outstanding_balance' do
        @joel.charge(15)
        @joel.charge(7)

        expect(@joel.outstanding_balance).to eq(22)
    end
end
