require "./lib/rectangle"

#Unskip the tests one-by-one, then edit the Rectangle class so that each test passes.
RSpec.describe Rectangle do
  describe "setup" do
    it "exists" do
      r = Rectangle.new("blue", 5, 10)
    end
  end

  describe "Has a color, length, and width" do
    it "has the parent Shape" do
      r = Rectangle.new("blue", 5, 10)
      expect(r.is_a?(Shape)).to eq(true)
    end
    
    it "can access color, length, and width attributes from parent Shape" do
      r = Rectangle.new("blue", 5, 10)
      expect(r.color).to eq("blue")
      expect(r.length).to eq(5)
      expect(r.width).to eq(10)
    end

    it "can calculate area from parent Shape method" do
      r = Rectangle.new("blue", 5, 10)
      expect(r.area).to eq(50)
    end

    it "can calculate perimeter from parent Shape method" do
      r = Rectangle.new("blue", 5, 10)
      expect(r.perimeter).to eq(30)
    end
  end
end