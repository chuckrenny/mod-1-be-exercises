require './lib/ceo'

RSpec.describe Ceo do

  describe "setup" do
    it "exists" do
      ceo = Ceo.new(15,20, "Daniel", 3349)
    end
    it "has base_salary and bonus attributes" do
      ceo = Ceo.new(15,20, "Daniel", 3349)
      expect(ceo.base_salary).to eq(15)
      expect(ceo.bonus).to eq(20)
    end
  end

  describe "Has a name, ID, and total_compensation" do
    # Write tests to prove that a Ceo instance can have a Name and ID number, like any other Employee.
    it 'has a name and id' do
      ceo = Ceo.new(15, 20, "Daniel", 3349)
      expect(ceo.name).to eq("Daniel")
      expect(ceo.id).to eq(3349)
    end

    # Also, the CEO should be able to receive a total compensation. Write at least one test that proves they can access this method.
    it 'can access total compensation in employee parent class' do
      ceo = Ceo.new(15, 20, "Daniel", 3349)
      expect(ceo.total_compensation).to eq(35)
    end

    it 'can access benefits in employee parent class' do
      ceo = Ceo.new(15, 20, "Daniel", 3349)
      expect(ceo.benefits).to eq([:sick_leave])
    end
  end

end