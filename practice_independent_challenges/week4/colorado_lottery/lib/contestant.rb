class Contestant
  attr_reader :full_name,
              :age,
              :state_of_residence,
              :game_interests

  attr_accessor :spending_money

  def initialize(data)
    @full_name = "#{data[:first_name]} #{data[:last_name]}"
    @age = data[:age]
    @state_of_residence = data[:state_of_residence]
    @spending_money = data[:spending_money]
    @out_of_state = @state_of_residence != 'CO'
    @game_interests = []
  end

  def out_of_state?
    @out_of_state
  end

  def add_game_interest(game)
    @game_interests << game
  end
end