class PuertoRico::Island
  attr_accessor :plantations
  
  def max_size
    12
  end
  
  def initialize
    @plantations = []
  end
  
  def size
    @plantations.length
  end
  
  def << obj
    @plantations << obj
  end
  
  def available_slots
    @plantations.select{|plantation| plantation.unoccupied?}.length
  end
  
  def colonist_count
    sum = 0
    @plantations.each{|plantation| sum += plantation.colonist_count}
    sum
  end
  
  def return_colonists player
    @plantations.each do |plantation|
      plantation.return_colonist player
    end
  end
  
  def has_available_plantation? good_type
    plantations.select{|plantation| plantation.good_produced == good_type}.length > 0
  end
  
  def unoccupied_plantations good_type
    plantations.select{|plantation| plantation.good_produced == good_type and not plantation.occupied? }
  end
  
  def unoccupied_corn_plantations
    unoccupied_plantations PuertoRico::Corn
  end
  
  def unoccupied_quarries
    unoccupied_plantations :quarry
  end
  
  def occupied_plantations good_type = nil
    if good_type
      plantations.select{|plantation| plantation.good_produced == good_type and plantation.occupied? } 
    else
      plantations.select{|plantation| plantation.occupied? } 
    end           
  end
  
  def occupied_corn_plantations
    occupied_plantations PuertoRico::Corn
  end
  
  def occupied_quarries
    occupied_plantations :quarry
  end
  
  def add_colonist_to good_type, player
    self.plantations[first_unoccupied_index_of(good_type)] << player.colonists.shift
  end
  
  def first_unoccupied_index_of good_type
    where = nil
    self.plantations.each_with_index do |plantation, j|
      where = j if plantation.good_produced == good_type && plantation.unoccupied?
    end
    where
  end
  
  def craft game
    the_goods = []
    occupied_corn_plantations.each do |plantation|  
      game.good_supply.goods.find_and_move(the_goods){|good| good.class == PuertoRico::Corn}
    end
    the_goods
  end
  
end