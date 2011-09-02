class PuertoRico::TradingHouse
  
  attr_accessor :spaces
  
  def initialize
    @spaces = []
  end
  
  def full?
    @spaces.length == 4
  end
  
  def has? good_type
    @spaces.select{|space| space.class == good_type}.length > 0
  end
  
  def clear game 
    while !@spaces.empty?
      game.good_supply << @spaces.shift
    end     
  end
  
  def print_trade_options game, player
    can_sell = []
    
    if player.city.buildings.detect{|building| building.class == Office}
      can_sell << player.goods.uniq
    else
      player.goods.uniq.each do |good|
        can_sell << good unless self.has?(good.class)
      end
    end
    
    if self.full?
      # do nothing
    elsif can_sell.empty?
      puts "Player #{player.name} has no goods to sell"
    else
      can_sell.each do |good|
        puts good.class
      end
      puts "PASS"  
    end
  end
  
end