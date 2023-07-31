require 'spec_helper'

RSpec.describe Renter do
  before(:each) do
    @renter = Renter.new("Patrick Star", "4242424242424242")
  end

  describe "#initialize" do
    it 'can initialize cell class' do
      expect(@renter).to be_a(Renter)
    end

    it 'has readable attributes' do
      expect(@renter.name).to eq("Patrick Star")
      expect(@renter.credit_card_number).to eq("4242424242424242")
    end
  end


end