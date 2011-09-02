class PuertoRico::ColonistSupply
  attr_accessor :colonists
  
  def initialize game
    @colonists = []
    case game.number_of_players
    when 3
      55.times {@colonists << PuertoRico::Colonist.new}
    when 4
      75.times {@colonists << PuertoRico::Colonist.new}
    when 5
      95.times {@colonists << PuertoRico::Colonist.new}
    end
  end
  
  def remaining
    colonists.size
  end
  
end