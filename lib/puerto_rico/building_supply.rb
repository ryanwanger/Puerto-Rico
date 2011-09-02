class PuertoRico::BuildingSupply
  attr_accessor :buildings
  
  def initialize
    @buildings = PuertoRico::Building.generate_supply
  end
end