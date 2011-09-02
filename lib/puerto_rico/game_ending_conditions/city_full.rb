class PuertoRico::CityFull < PuertoRico::GameEndingCondition
  
  def self.game_over? game
    game.the_players.each do |player|
      return true if player.city.full?
    end
    false
  end
  
end