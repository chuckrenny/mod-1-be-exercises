require 'pry'
require 'rspec'
require './lib/player'
require './lib/team'

RSpec.describe Team do
    before(:each) do
        @team = Team.new("France")
        @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
        @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    end
    # let{:player} {Player.new({name: "Luka Modric", position: "midfielder"})}

    it 'exists as a team' do 
      expect(@team).to be_an(Team)
    end

    it 'can access attributes' do
      expect(@team.country).to eq("France")
      expect(@team.eliminated).to eq(false)
      expect(@team.players).to eq([])
    end

    it 'can add players' do
      @team.add_player(@mbappe)
      @team.add_player(@pogba)
      expect(@team.players).to eq([@mbappe, @pogba])
    end
    
    it 'can find playsers by position' do
      @team.add_player(@mbappe)
      @team.add_player(@pogba)
      
      expect(@team.players_by_position("midfielder")).to eq([@pogba])
      expect(@team.players_by_position("defender")).to eq([])
    end
end