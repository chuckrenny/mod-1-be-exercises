require './libc/customer'
require './libc/pet'
require './libc/daycare'
require 'rspec'

RSpec.describe Daycare do
    before(:each) do
        @feeding_prices = {:dog => 5, :cat => 3}
        @daycare1 = Daycare.new("Jones Daycare", @feeding_prices)
    end

    describe "Object" do 
        it 'can intialize' do
            expect(@daycare1).to be_a(Daycare)
        end

        it 'can access attributes' do
            expect(@daycare1.name).to eq("Jones Daycare")
            expect(@daycare1.customers).to eq([])
        end
    end

    describe "Integrations with Pets and Customers" do
        before(:each) do
            @joel = Customer.new("Joel", 2)
            @billy = Customer.new("Billy", 3)
            @samson = Pet.new({name: "Samson", type: :dog, age: 3})
            @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})  
            @molly = Pet.new({name: "Molly", type: :cat, age: 4})
            
        end

        it 'can add customers' do
            @daycare1.add_customers(@joel)
            @daycare1.add_customers(@billy)
            expect(@daycare1.customers).to eq([@joel, @billy])
        end

        it 'can find customers by id' do
            @daycare1.add_customers(@joel)
            @daycare1.add_customers(@billy)

            expect(@daycare1.customer_by_id(2)).to eq(@joel)
        end

        it 'can list unfed pets' do
            @joel.adopt(@samson)
            @joel.adopt(@lucy)
            @billy.adopt(@molly)

            @daycare1.add_customers(@joel)
            @daycare1.add_customers(@billy)

            expect(@daycare1.unfed_pets).to eq([@samson, @lucy, @molly])

            @samson.feed
            expect(@daycare1.unfed_pets).to eq([@lucy, @molly])
        end
    end

    describe "Feed all unfed pets and charge customers" do
        before(:each) do
            @joel = Customer.new("Joel", 2)
            @billy = Customer.new("Billy", 3)
            @samson = Pet.new({name: "Samson", type: :dog, age: 3})
            @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})  
            @molly = Pet.new({name: "Molly", type: :cat, age: 4})
        end

        it 'can feed all unfed pets' do
            @joel.adopt(@samson)
            @joel.adopt(@lucy)
            @billy.adopt(@molly)

            @daycare1.add_customers(@joel)
            @daycare1.add_customers(@billy)

            expect(@daycare1.unfed_pets).to eq([@samson, @lucy, @molly])
            @daycare1.feed_and_charge_unfed_pets

            expect(@joel.outstanding_balance).to eq(8)
            expect(@billy.outstanding_balance).to eq(3)
        end
    end
end