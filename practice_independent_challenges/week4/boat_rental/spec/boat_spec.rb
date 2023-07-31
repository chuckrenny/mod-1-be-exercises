require 'spec_helper'

RSpec.describe Boat do
  before(:each) do
    @kayak = Boat.new(:kayak, 20)
  end

  describe "#initialize" do
    it 'can initialize Boat class' do
      expect(@kayak).to be_a(Boat)
    end

    it 'has readable attributes' do
      expect(@kayak.type).to eq(:kayak)
      expect(@kayak.price_per_hour).to eq(20)
    end
  end
  
  describe "#hours_rented & #add_hour" do
    it 'can display the hours rented' do
      expect(@kayak.hours_rented).to eq(0)
    end

    it 'can increment hours rented' do
      expect(@kayak.hours_rented).to eq(0)
      @kayak.add_hour
      @kayak.add_hour
      @kayak.add_hour
      expect(@kayak.hours_rented).to eq(3)
    end
  end

end