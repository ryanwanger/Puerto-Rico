class PuertoRico::Plantation
  attr_accessor :colonists
  attr_accessor :good_produced
  
  def self.inherited klass
    return unless klass.instance_of? Class
    self.children << klass
  end
  
  def self.children
    unless defined? @children
      @children = []
    end
    return @children
  end
  
  def initialize
    @colonists = []
    @good_produced = self.class.good_produced
  end
  
  def << colonist
    @colonists << colonist
  end
  
  def has_colonist?
    colonist_count == 1
  end
  
  def occupied?
    has_colonist?
  end
  
  def unoccupied?
    !has_colonist?
  end
  
  def colonist_count
    @colonists.length
  end
  
  def return_colonist player
    if has_colonist?
      player << @colonists.shift
    end
  end
  
  def self.count
    # quarries don't have a good that they produce, so just return their count
    if self.class == PuertoRico::Quarry
      self.class.count
    else
      good_produced.count
    end
  end
  
end