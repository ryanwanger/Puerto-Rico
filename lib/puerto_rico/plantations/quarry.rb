class PuertoRico::Quarry < PuertoRico::Plantation
  
  def initialize
    @good_produced = :quarry
  end
  
  # quarries don't produce a good, so just set their count here...not sure about the initalize above...works for now
  def self.count
    8
  end
  
end