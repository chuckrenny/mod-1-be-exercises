require "./lib/circle"

RSpec.describe Circle do 
    it "exists" do
      c = Circle.new("green", 2)
      expect(c).to be_instance_of(Circle)
    end

    it "can access radius and color" do
      c = Circle.new("green", 2)

      expect(c.color).to eq("green")
      expect(c.radius).to eq(2)
    end

    it "can calculate circumference of a circle" do
      c = Circle.new("green", 2)

      expect(c.circumference).to eq(4*Math::PI)
    end

    it "can calculate the area of a circle" do
      c = Circle.new("green", 2)

      expect(c.area).to eq(8*Math::PI)
    end
end