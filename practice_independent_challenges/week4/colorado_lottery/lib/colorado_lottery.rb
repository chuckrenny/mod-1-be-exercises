class ColoradoLottery
  attr_reader :registered_contestants,
              :winners,
              :current_contestants


  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    contestant.age >= 18 && contestant.game_interests.include?(game.name)
  end

  def can_register?(contestant, game)
    interested_and_18?(contestant, game) && (game.national_drawing? || !contestant.out_of_state?)
  end

  def register_contestant(contestant, game)
    if can_register?(contestant, game)
      @registered_contestants[game] ||= []
      @registered_contestants[game] << contestant
    end
    contestant
  end

  def eligible_contestants(game)
    @registered_contestants[game].select do |contestant|
      contestant.spending_money >= game.cost
    end
  end
  
  def charge_contestants(game)
    @registered_contestants[game].each do |contestant|
      if contestant.spending_money >= game.cost
        contestant.spending_money -= game.cost
        @current_contestants[game] ||= []
        @current_contestants[game] << contestant.full_name
      end
    end
    @current_contestants
  end

  def current_contestants
    @current_contestants
  end
  
end
