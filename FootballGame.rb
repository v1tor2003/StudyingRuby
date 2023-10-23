module FootballGame
  module Players
    class User
      attr_accessor :name
      attr_accessor :team
      
      def initialize(name, team_name)
        @name = name
        @team = Teams::Team.new team_name
      end

      def to_s
        return "#{@name}, dono de #{team.name}"
      end
    end
    
    class Player
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def to_s
        return @name
      end
    end
  end
  module Teams
    class Team
      attr_accessor :players
      attr_reader :name
      
      def initialize (name)
        @name = name
        @players = Array.new()
      end
  
      def contract_player (player)
        @players.push(player)
      end
  
      def show_players
        puts "#{@name} have the players: #{@players}"
      end
    end
  end
end
