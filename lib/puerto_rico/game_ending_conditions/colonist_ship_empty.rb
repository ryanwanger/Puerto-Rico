class PuertoRico::ColonistShipEmpty < PuertoRico::GameEndingCondition
  
  def self.game_over? game
    game.colonist_ship.not_filled
  end
  
end