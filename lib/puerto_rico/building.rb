class PuertoRico::Building
  attr_accessor :name
  attr_accessor :colonist_slots
  attr_accessor :victory_points
  attr_accessor :cost
  attr_accessor :size
  attr_accessor :colonists
  
  
  # this is just a little trick...turns out they are equivalent
  def max_quarry_discount
    victory_points
  end
  
  def self.inherited klass
    return unless klass.instance_of? Class
    self.children << klass.children
  end
  
  def self.children
    unless defined? @children
      @children = []
    end
    return @children
  end
  
  def initialize
    @colonists = []
  end
  
  def << colonist
    if fully_occupied?
      puts "#{name} is already full!"  # if this happens, then the passed in colonist will be abandoned in the ether?
    else
      @colonists << colonist
    end
  end
  
  def self.generate_supply
    supply = []
    children.flatten.each do |child|
      child.number_in_supply.times {supply << child.new}
    end
    supply
  end
  
  def empty?
    colonist_count == 0
  end
  
  def available_slots
    @colonist_slots - @colonists.length
  end
  
  def colonist_count
    @colonists.length
  end
  
  def return_colonists player
    player << @colonists.shift until empty?
  end
  
  def fully_occupied?
    @colonists.size == @colonist_slots
  end
  
  def can_be_bought_by? player
    player.city.does_not_include?(self) and adjusted_cost_for(player) <= player.doubloons and player.city.spaces_left >= self.size
  end
  
  def adjusted_cost_for player
    cost - quarry_discount_for(player)
  end
  
  # whichever is lower, the player's quarry discount, or the buildings max quarry discount
  def quarry_discount_for player
    player.current_quarry_discount > max_quarry_discount ? max_quarry_discount : player.current_quarry_discount
  end
    
end