class PuertoRico::SmallIndigoPlant < PuertoRico::ProductionBuilding
  
  def self.number_in_supply
    4
  end
  
  def initialize
    super
    @name = "Small Indigo Plant"
    @colonist_slots = 1
    @victory_points = 1
    @cost = 1
    @size = 1
    @good_produced = PuertoRico::Indigo
  end
  
end