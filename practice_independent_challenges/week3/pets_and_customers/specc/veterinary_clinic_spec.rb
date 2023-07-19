require './libc/customer'
require './libc/pet'
require './libc/veterinary_clinic'
require 'rspec'

RSpec.describe VeterinaryClinic do
    before(:each) do
        @vet = VeterinaryClinic.new("Vet 24.7")
        @joel = Customer.new("Joel", 2)
        @billy = Customer.new("Billy", 3)
        @samson = Pet.new({name: "Samson", type: :dog, age: 3})
        @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})  
        @molly = Pet.new({name: "Molly", type: :cat, age: 4})
    end

    describe 'Object' do
        it 'can initialize' do
            expect(@vet).to be_a(VeterinaryClinic)
        end

        it 'can access attributes' do
            expect(@vet.name).to eq("Vet 24.7")
            expect(@vet.customers).to eq([])
        end
    end

    describe 'List all Pets under Care by Age' do
        it 'can list all pets under care by oldest to youngest' do
            @vet.add_customer(@joel)
            @vet.add_customer(@billy)

            @joel.adopt(@samson)
            @joel.adopt(@lucy)
            @billy.adopt(@molly)

            expect(@vet.list_pets_by_age).to eq([@lucy, @molly, @samson])
        end
    end

    describe 'Count number of pets of a customer' do
        it 'can count the number of customer pets' do
            @vet.add_customer(@joel)
            @vet.add_customer(@billy)

            @joel.adopt(@samson)
            @joel.adopt(@lucy)
            @billy.adopt(@molly)

            expect(@vet.count_pets).to eq({"Joel" => 2, "Billy" => 1})
        end
    end
end