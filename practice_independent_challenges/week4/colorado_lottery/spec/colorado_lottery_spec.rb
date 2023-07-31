require 'spec_helper' 

RSpec.describe ColoradoLottery do
  before(:each) do
    @lottery = ColoradoLottery.new

    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
    @cash_5 = Game.new('Cash 5', 1)

    @alexander = Contestant.new({
      first_name: 'Alexander',
      last_name: 'Aigades',
      age: 28,
      state_of_residence: 'CO',
      spending_money: 10})

    @benjamin = Contestant.new({
      first_name: 'Benjamin',
      last_name: 'Franklin',
      age: 17,
      state_of_residence: 'PA',
      spending_money: 100})

    @frederick = Contestant.new({
      first_name:  'Frederick',
      last_name: 'Douglass',
      age: 55,
      state_of_residence: 'NY',
      spending_money: 20})

    @winston = Contestant.new({
      first_name: 'Winston',
      last_name: 'Churchill',
      age: 18,
      state_of_residence: 'CO',
      spending_money: 5})
  end

  describe "#initialize" do
    it 'can initialize lottery as ColoradoLottery class' do
      expect(@lottery).to be_a(ColoradoLottery)
    end

    it 'can access the attributes in ColoradoLottery' do
      expect(@lottery.registered_contestants).to eq({})
      expect(@lottery.winners).to eq([])
      expect(@lottery.current_contestants).to eq({})
    end
  end

  describe "#interested_and_18?" do
    it 'can check if contestant is interested and of age' do
      @alexander.add_game_interest('Pick 4')
      @alexander.add_game_interest('Mega Millions')
      @frederick.add_game_interest('Mega Millions')
      @winston.add_game_interest('Cash 5')
      @winston.add_game_interest('Mega Millions')
      @benjamin.add_game_interest('Mega Millions')

      expect(@lottery.interested_and_18?(@alexander, @pick_4)).to eq(true)
      expect(@lottery.interested_and_18?(@benjamin, @mega_millions)).to eq(false)
      expect(@lottery.interested_and_18?(@alexander, @cash_5)).to eq(false)
    end
  end

  describe "#can_register?" do
    it 'can determine if a contestant can register for a lottery game' do
      @alexander.add_game_interest('Pick 4')
      @alexander.add_game_interest('Mega Millions')
      @frederick.add_game_interest('Mega Millions')
      @winston.add_game_interest('Cash 5')
      @winston.add_game_interest('Mega Millions')
      @benjamin.add_game_interest('Mega Millions')

      expect(@lottery.can_register?(@alexander, @pick_4)).to eq(true)
      expect(@lottery.can_register?(@alexander, @cash_5)).to eq(false)
      expect(@lottery.can_register?(@frederick, @mega_millions)).to eq(true)
      expect(@lottery.can_register?(@benjamin, @mega_millions)).to eq(false)
      expect(@lottery.can_register?(@frederick, @cash_5)).to eq(false)
    end
  end

  describe "#register_contestant" do
    it 'can only register contestants that returns true from #can_register' do
      @alexander.add_game_interest('Pick 4')
      @alexander.add_game_interest('Mega Millions')

      expect(@lottery.register_contestant(@alexander, @pick_4)).to eq(@alexander)
      expect(@lottery.registered_contestants[@pick_4]).to eq([@alexander])
    end
  end

  describe "#eligible_contestants" do
    it 'can list all contestants who are registered to play and can cover the cost' do
      @alexander.add_game_interest('Pick 4')
      @alexander.add_game_interest('Mega Millions')
      @frederick.add_game_interest('Mega Millions')
      @winston.add_game_interest('Cash 5')
      @winston.add_game_interest('Mega Millions')
      @benjamin.add_game_interest('Mega Millions')

      @lottery.register_contestant(@alexander, @pick_4)
      @lottery.register_contestant(@alexander, @mega_millions)
      @lottery.register_contestant(@frederick, @mega_millions)
      @lottery.register_contestant(@frederick, @pick_4)
      @lottery.register_contestant(@winston, @cash_5)
      @lottery.register_contestant(@winston, @mega_millions)
      @lottery.register_contestant(@benjamin, @cash_5)

      eligible_contestants = [@alexander, @frederick, @winston]

      expect(@lottery.eligible_contestants(@mega_millions)).to eq([@alexander, @frederick, @winston])
    end
  end

  describe "#current_contestants" do
    it 'can give a list of charged contestant names, organized by game' do
      @alexander.add_game_interest('Pick 4')
      @alexander.add_game_interest('Mega Millions')
      @frederick.add_game_interest('Mega Millions')
      @winston.add_game_interest('Cash 5')
      @winston.add_game_interest('Mega Millions')
      @benjamin.add_game_interest('Mega Millions')

      @lottery.register_contestant(@alexander, @pick_4)
      @lottery.register_contestant(@alexander, @mega_millions)

      @lottery.register_contestant(@frederick, @mega_millions)
      @lottery.register_contestant(@frederick, @pick_4)
      
      @lottery.register_contestant(@winston, @cash_5)
      @lottery.register_contestant(@winston, @mega_millions)
      
      @lottery.register_contestant(@benjamin, @cash_5)

      result = {
        @cash_5 => [@winston.full_name],
        @mega_millions => [@alexander.full_name, @frederick.full_name]
      }

      @lottery.charge_contestants(@cash_5)
      @lottery.charge_contestants(@mega_millions)
      
      expect(@lottery.current_contestants).to eq(result)
    end

  end
end