class PuertoRico::SugarPlantation < PuertoRico::Plantation
  
  def self.good_produced
    PuertoRico::Sugar
  end
  
end