require './libc/customer'
require './libc/pet'
require './libc/groomer'
require 'rspec'

RSpec.describe Groomer do
    before(:each) do
        @groomer = Groomer.new("Daniel Grooming")
        @joel = Customer.new("Joel", 2)
        @billy = Customer.new("Billy", 3)
        @samson = Pet.new({name: "Samson", type: :dog, age: 3})
        @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})  
        @molly = Pet.new({name: "Molly", type: :cat, age: 4})
    end

    describe "Object" do 
        it 'can intialize' do
            expect(@groomer).to be_a(Groomer)
        end

        it 'can access attributes' do
            expect(@groomer.name).to eq("Daniel Grooming")
            expect(@groomer.customers).to eq([])
        end
    end

    describe "Find any outstanding balance" do
        it 'can add customers' do
            @groomer.add_customer(@joel)
            @groomer.add_customer(@billy)

            expect(@groomer.customers).to eq([@joel, @billy])
        end

        it 'can find the outstanding balances of customers' do
            @groomer.add_customer(@joel)
            @groomer.add_customer(@billy)

            @joel.outstanding_balance = 4
            @billy.outstanding_balance = 1

            expect(@groomer.find_outstanding_balances).to eq({"Joel" => 4, "Billy" => 1})
        end
    end

    describe 'Count the number of pets' do
        it 'can count the number of pets' do
            @groomer.add_customer(@joel)
            @groomer.add_customer(@billy)

            @joel.adopt(@samson)
            @joel.adopt(@lucy)
            @billy.adopt(@molly)

            expect(@groomer.pet_count).to eq(:dog => 1, :cat => 2)
        end
    end
end