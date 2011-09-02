class PuertoRico::PlantationSupply
  
  attr_accessor :plantations
  
  # TODO: need a supply of previously tossed plantations
  
  def initialize
    @plantations = []
    PuertoRico::Plantation.children.each do |child|
      child.count.times {@plantations << child.new}
    end
    @plantations.shuffle!
  end
  
  def has? plantation_type
    plantations.detect{|plantation| plantation.class == plantation_type}
  end
  
  def size
    @plantations.size
  end
  
end