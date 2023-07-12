require 'rspec'
require './lib/dish'
require './lib/potluck'


RSpec.describe Potluck do
  let(:potluck)  {Potluck.new("7-13-18")}

  let(:couscous_salad)  {Dish.new("Couscous Salad", :appetizer)}
  let(:cocktail_meatballs)  {Dish.new("Cocktail Meatballs", :entre)}
  
  describe '#initialize' do
    it 'is a potluck' do
        expect(potluck).to be_a(Potluck)
    end

    it 'can read and access attributes' do
        expect(potluck.date).to eq("7-13-18")
        expect(potluck.dishes).to eq([])
    end
  end

  describe '#add_dish' do
    it 'can add dish to dishes' do
      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)

      expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
      expect(potluck.dishes.length).to eq(2)
    end
  end
end