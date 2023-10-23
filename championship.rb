require_relative 'FootballGame'

class Championship
  attr_reader :players
  
  def initialize name
    @name = name
    @players = Array.new 4
  end

  def include_player player
    @players.push player
  end

  def show_players
    @players.each do |player|
      puts player if player
    end
  end
end

user = FootballGame::Players::User.new 'Vitor', 'Baile de Munique' 
user.team.contract_player 'Pessi'
user.team.contract_player 'Penaldo'
user.team.contract_player 'Khvicha Kvaratskhelia'
user.team.show_players


champ = Championship.new 'Champions League'
champ.include_player user
champ.show_players
