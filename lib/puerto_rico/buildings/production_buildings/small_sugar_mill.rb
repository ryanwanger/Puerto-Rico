class PuertoRico::SmallSugarMill < PuertoRico::ProductionBuilding
  
  def self.number_in_supply
    4
  end
  
  def initialize
    super
    @name = "Small Sugar Mill"
    @colonist_slots = 1
    @victory_points = 1
    @cost = 2
    @size = 1
    @good_produced = PuertoRico::Sugar
  end
  
end