class PuertoRico::Good

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
  
  def self.price
  end
  
  def self.size
  end
  
  def can_ship? game, player
    game.ships.any?{|ship| ship.not_full?} && game.ships.detect{|ship| ship.slots.first == self.class.new && ship.full?} == nil
  end
  
end