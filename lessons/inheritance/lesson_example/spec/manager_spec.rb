require "./lib/manager"

RSpec.describe Manager do
  describe "setup" do
    it "exists" do
      manager = Manager.new(12, 'Ben', 2111)
      expect(manager).to be_a Manager
    end

    it "has base_salary, per_team_rate, and departments attributes" do
      manager = Manager.new(12, 'Ben', 2111)
      expect(manager.base_salary).to eq(12)
      expect(manager.per_team_rate).to eq 5
      expect(manager.departments).to be_instance_of Array
      expect(manager.departments.length).to eq (0)
    end

    it "can add_department" do
      manager = Manager.new(12, 'Ben', 2111)
      manager.add_department("Sales")
      expect(manager.departments).to eq(["Sales"])
      expect(manager.departments.length).to eq(1)
    end

    it "has benefits to start with" do
      manager = Manager.new(12, 'Ben', 2111)
      expect(manager.benefits).to eq([:sick_leave, :health_insurance])
    end
  end

  describe "Ability to have name and ID, like any other Employee" do
    # Write tests to prove that a Manager instance can have a Name and ID number, like any other Employee.
    it 'has a name and id number' do
      manager = Manager.new(20, 'Ben', 2111)
      expect(manager.name).to eq('Ben')
      expect(manager.id).to eq(2111)
    end
    # Also, a Manager should be able to receive a total compensation. Write at least one test that proves they can access this method.
    it 'can receive total compensation from its own method and override parent class' do
      manager = Manager.new(20, 'Ben', 2111)
      expect(manager.total_compensation).to eq(120)
    end

    it 'can receive benefits from its own method' do
      manager = Manager.new(20, 'Ben', 2111)
      expect(manager.benefits).to eq([:sick_leave, :health_insurance])
    end
  end
end