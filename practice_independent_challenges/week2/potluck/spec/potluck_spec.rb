require 'rspec'
require './lib/dish'
require './lib/potluck'


RSpec.describe Potluck do
  let(:potluck)  {Potluck.new("7-13-18")}

  let(:couscous_salad)  {Dish.new("Couscous Salad", :appetizer)}
  let(:cocktail_meatballs)  {Dish.new("Cocktail Meatballs", :entre)}
  let(:summer_pizza) {Dish.new("Summer Pizza", :appetizer)}
  let(:roast_pork) {Dish.new("Roast Pork", :entre)}
  let(:cocktail_meatballs) {Dish.new("Cocktail Meatballs", :entre)}
  let(:candy_salad) {Dish.new("Candy Salad", :dessert)}
  let(:bean_dip) {Dish.new("Bean Dip", :appetizer)}

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

  describe '#get_all_from_category' do
    it 'can add dish to dishes' do
      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(candy_salad)

      expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs, summer_pizza, roast_pork, candy_salad])

      expect(potluck.get_all_from_category(:appetizer)).to eq([couscous_salad, summer_pizza])

      expect(potluck.get_all_from_category(:appetizer).first).to eq(couscous_salad)
      expect(potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
    end
  end

  describe '#menu' do
    it 'can get the menu with categories sorted as keys and items as values' do
      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(candy_salad)
      potluck.add_dish(bean_dip)

      menu_items = {
        appetizers: ["Bean Dip", "Couscous Salad", "Summer Pizza"],
        entres: ["Cocktail Meatballs", "Roast Pork"],
        desserts: ["Candy Salad"]
      }

      expect(potluck.menu).to eq(menu_items)
    end
  end

  describe '#ratio' do
    it 'can find the ratio of appetizers to the course' do
      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(candy_salad)
      potluck.add_dish(bean_dip)

      expect(potluck.ratio(:appetizer)).to eq(50.0)
    end
  end
end