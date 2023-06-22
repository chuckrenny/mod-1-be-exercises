require './lib/camry'

RSpec.describe Camry do
  before :each do
    @camry = Camry.new
  end

  it 'exists' do
    expect(@camry).to be_a(Camry)
  end

  it 'can start' do
    expect(@camry.start).to eq("Engine on!")
  end

  it 'can stop' do
    expect(@camry.stop).to eq("Engine off!")
  end

  it 'can drive' do
    expect(@camry.drive).to eq("Back wheels go!")
  end

  it 'can turn ac on' do
    expect(@camry.turn_ac_on).to eq("Chilly air coming your way!")
  end

  it 'can turn ac off' do
    expect(@camry.turn_ac_off).to eq("Temp is fine in here.")
  end
end
