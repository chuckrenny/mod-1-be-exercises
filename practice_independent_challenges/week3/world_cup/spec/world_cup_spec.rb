require 'pry'
require 'rspec'
require './lib/player'
require './lib/team'
require './lib/world_cup'

RSpec.describe WorldCup do
    before(:each) do
        @france = Team.new("France")
        @croatia = Team.new("Croatia")

        @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
        @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
        @modric = Player.new({name: "Luka Modric", position: "midfielder"})
        @vida = Player.new({name: "Domagoj Vida", position: "defender"}) 

        @world_cup = WorldCup.new(2018, [@france, @croatia]) 
    end

    it 'exists as a world cup' do 
      expect(@world_cup).to be_an(WorldCup)
    end

    it 'can access attributes' do
      @france.add_player(@mbappe) 
      @france.add_player(@pogba)
      @croatia.add_player(@modric)
      @croatia.add_player(@vida) 
      
      expect(@world_cup.year).to eq(2018)
      expect(@world_cup.teams).to eq([@france, @croatia])
    end

    it 'can find all players from all countries by position' do
      @france.add_player(@mbappe) 
      @france.add_player(@pogba)
      @croatia.add_player(@modric)
      @croatia.add_player(@vida) 

      expect(@world_cup.active_players_by_position("midfielder")).to eq([@pogba, @modric])
    end

    it 'can eliminate countries from the world cup and remove the players' do
      @france.add_player(@mbappe) 
      @france.add_player(@pogba)
      @croatia.add_player(@modric)
      @croatia.add_player(@vida) 

      @croatia.eliminated = true 

      expect(@world_cup.active_players_by_position("midfielder")).to eq([@pogba])
    end

    it 'can list all players by position' do
      @france.add_player(@mbappe) 
      @france.add_player(@pogba)
      @croatia.add_player(@modric)
      @croatia.add_player(@vida) 

      all_players_position = {
        "forward" => [@mbappe],
        "midfielder" => [@pogba, @modric],
        "defender" => [@vida]
      }

      expect(@world_cup.all_players_by_position).to eq(all_players_position)
    end
end