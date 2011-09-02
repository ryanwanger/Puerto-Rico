class PuertoRico::VictoryPointSupply
  
  attr_accessor :victory_points
  
  # this will need to keep awarding victory points even after it is empty
  
  def initialize game
    @victory_points = []
    case game.number_of_players
    when 3
      75.times {@victory_points << PuertoRico::VictoryPoint.new}
    when 4
      100.times {@victory_points << PuertoRico::VictoryPoint.new}
    when 5
      122.times {@victory_points << PuertoRico::VictoryPoint.new}
    end
  end
  
  def empty?
    @victory_points.empty?
  end
end