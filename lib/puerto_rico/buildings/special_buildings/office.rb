class PuertoRico::Office < PuertoRico::ProductionBuilding
  
  def self.number_in_supply
    2
  end
  
  def initialize
    super
    @name = "Office"
    @colonist_slots = 1
    @victory_points = 2
    @cost = 5
    @size = 1
  end
  
end