require 'spec_helper'

RSpec.describe Dock do
  before(:each) do
    @dock = Dock.new("The Rowing Dock", 3)

    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)  
    @sup_1 = Boat.new(:standup_paddle_board, 15)

    @patrick = Renter.new("Patrick Star", "4242424242424242") 
    @eugene = Renter.new("Eugene Crabs", "1313131313131313") 

  end

  describe "#initialize" do
    it 'can initialize dock class' do
      expect(@dock).to be_a(Dock)
    end

    it 'can access attributes in Dock class' do
      expect(@dock.name).to eq("The Rowing Dock")
      expect(@dock.max_rental_time).to eq(3)
    end
  end

  describe "#rent" do
    it 'can rent out equipment to people' do
      expect(@dock.rental_log).to eq({})

      @dock.rent(@kayak_1, @patrick)    
      @dock.rent(@kayak_2, @patrick)    
      @dock.rent(@sup_1, @eugene)    

      rental_log = {
        @kayak_1 => @patrick,
        @kayak_2 => @patrick,
        @sup_1 => @eugene
      }
      expect(@dock.rental_log).to eq(rental_log)
    end
  end

  describe "#charge" do
    it 'can charge' do
      @dock.rent(@kayak_1, @patrick)    
      @dock.rent(@kayak_2, @patrick)    
      @dock.rent(@sup_1, @eugene)  

      @kayak_1.add_hour
      @kayak_1.add_hour

      dock_charge = {
        :card_number => "4242424242424242",
        :amount => 40
      }

      expect(@dock.charge(@kayak_1)).to eq(dock_charge)
    end

    it 'can limit the max hours' do
      @dock.rent(@kayak_1, @patrick)    
      @dock.rent(@kayak_2, @patrick)    
      @dock.rent(@sup_1, @eugene)  

      @kayak_1.add_hour
      @kayak_1.add_hour
      @kayak_1.add_hour
      @kayak_1.add_hour

      dock_charge = {
        :card_number => "4242424242424242",
        :amount => 60
      }

      expect(@dock.charge(@kayak_1)).to eq(dock_charge)
    end
  end

  describe "#return" do
    it 'can return the boat' do
      @dock.rent(@sup_1, @eugene)  

      @sup_1.add_hour
      @sup_1.add_hour
      @sup_1.add_hour

      @dock.charge(@sup_1)

      @dock.return(@sup_1)
      expect(@dock.rental_log).to eq({})
    end
  end

  describe "#log_hour" do
    it 'can increment all rented boats by an additional hour' do
      @dock.rent(@kayak_1, @patrick)    
      @dock.rent(@kayak_2, @patrick)    
      @dock.rent(@sup_1, @eugene)  

      @kayak_1.add_hour
      @kayak_2.add_hour
      @sup_1.add_hour

      @dock.log_hour

      expect(@kayak_1.hours_rented).to eq(2)
      expect(@kayak_2.hours_rented).to eq(2)
      expect(@sup_1.hours_rented).to eq(2)
    end
  end

  describe "#revenue" do
    it 'returns the total revenue of all the boats' do
      @dock.rent(@kayak_1, @patrick)    
      @dock.rent(@kayak_2, @patrick)    
      @dock.rent(@sup_1, @eugene)  

      @kayak_1.add_hour
      @kayak_2.add_hour
      @sup_1.add_hour

      @dock.log_hour
      @dock.log_hour
      expect(@dock.revenue).to eq(165)
    end
  end
end