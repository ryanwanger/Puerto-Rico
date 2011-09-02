class PuertoRico::ProductionBuilding < PuertoRico::Building
  
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
  
  def has_available_plantation? player
    player.island.has_available_plantation? good_produced
  end

  def refining_capacity
    potential_goods = []
    colonist_count.times{potential_goods << good_produced}
    potential_goods
  end
  
end