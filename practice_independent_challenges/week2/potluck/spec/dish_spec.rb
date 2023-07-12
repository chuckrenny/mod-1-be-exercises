require 'rspec'
require './lib/dish'

RSpec.describe Dish do
  let(:dish)  {Dish.new("Couscous Salad", :appetizer)}
  describe '#initialize' do
    it 'is a dish' do
        expect(dish).to be_a(Dish)
    end

    it 'can read and access attributes' do
        expect(dish.name).to eq("Couscous Salad")
        expect(dish.category).to eq(:appetizer)
    end
  end
end