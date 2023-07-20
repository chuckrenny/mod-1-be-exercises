require 'pry'
require 'rspec'
require './lib/player'

RSpec.describe Player do
    before(:each) do
        @player = Player.new({name: "Luka Modric", position: "midfielder"})
    end
    # let{:player} {Player.new({name: "Luka Modric", position: "midfielder"})}

    it 'exists as a player' do 
      expect(@player).to be_an(Player)
    end

    it 'can access the attributes in Player' do
      expect(@player.name).to eq("Luka Modric")
      expect(@player.position).to eq("midfielder")
    end
end
