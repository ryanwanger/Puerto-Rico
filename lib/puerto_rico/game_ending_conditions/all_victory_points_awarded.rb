class PuertoRico::AllVictoryPointsAwarded < PuertoRico::GameEndingCondition
  
  def game_over? game
    game.victory_point_supply.empty?
  end
  
end