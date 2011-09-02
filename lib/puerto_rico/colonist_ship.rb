class PuertoRico::ColonistShip
  attr_accessor :minimum_number
  attr_accessor :colonists
  attr_accessor :not_filled
  
  def initialize game
    @not_filled = false
    @minimum_number = game.number_of_players
    @colonists = []
    game.number_of_players.times {@colonists << PuertoRico::Colonist.new} 
  end
  
  def refill game
    colonists_to_load = game.the_players.available_city_slots
    
    if colonists_to_load < game.number_of_players
      colonists_to_load = game.number_of_players
    end
    
    colonists_to_load.times{colonists << game.colonist_supply.colonists.shift}
    
    # if the number of colonists on the ship is less than the total that should have been loaded
    # then set the game over flag - this is a game end condition
    if colonists.size < game.the_players.available_city_slots
      not_filled = true
    end
  end
  
  def empty?
    colonists.empty?
  end
  
  def shift
    colonists.shift
  end
  
end