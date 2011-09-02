class PuertoRico::Role
  attr_accessor :doubloons
  attr_accessor :chooser
  
  def initialize
    @doubloons = 0
  end
  
  def resolve game

  end
  
  def award_bonus_doubloons
    chooser.doubloons += doubloons
    doubloons = 0
  end
  
  def not_chosen?
    chooser == nil
  end
  
end