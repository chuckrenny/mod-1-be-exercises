class WorldCup
    attr_reader :year,
                :teams

    def initialize(year, teams)
        @year = year
        @teams = teams
    end

    def active_players_by_position(role)
      @teams.find_all { |team| !team.eliminated }
            .flat_map { |team| team.players }
            .find_all { |player| player.position == role }
    end

    def all_players_by_position
        forward = players_by_position("forward")
        midfielder = players_by_position("midfielder")
        defender = players_by_position("defender")

        {
            "forward" => forward,
            "midfielder" => midfielder,
            "defender" => defender
        }
    end

    private

    def players_by_position(role)
        @teams.flat_map { |team|   team.players }
              .find_all { |player| player.position == role }
    end
end