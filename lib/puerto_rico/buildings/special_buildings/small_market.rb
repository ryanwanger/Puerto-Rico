class PuertoRico::SmallMarket < PuertoRico::SpecialBuilding
  
  def self.number_in_supply
    2
  end
  
  def initialize
    super
    @name = "Small Market"
    @colonist_slots = 1
    @victory_points = 1
    @cost = 1
    @size = 1
  end
  
end