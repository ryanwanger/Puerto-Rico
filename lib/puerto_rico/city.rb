class PuertoRico::City
  
  attr_accessor :buildings
  attr_accessor :max_size
  
  def initialize
    @buildings = []
    @max_size = 12
  end
  
  def available_slots
    sum = 0
    @buildings.each{|building| sum += building.available_slots} unless @buildings.empty?
    sum
  end
  
  def << object
    @buildings << object
  end
  
  def size
    size = 0
    buildings.each do |b|
      size += b.size
    end
    size
  end
  
  def spaces_left
    max_size - size
  end
  
  def full?
    size == max_size
  end
  
  def include? building
    buildings.detect{|existing_building| existing_building.class == building.class}
  end
  
  def does_not_include? building
    !include?(building)
  end
  
  def colonist_count
    sum = 0
    @buildings.each{|building| sum += building.colonist_count}
    sum
  end
  
  def return_colonists player
    @buildings.each do |building|
      building.return_colonists player
    end
  end
  
  def craft game, player
    
    refining_capacity = []
    production_buildings.each{|production_building| refining_capacity += production_building.refining_capacity}
    
    goods = []
    
    player.island.occupied_plantations.each do |plantation|
      refining_capacity.each_with_index do |good_type, j|
         if good_type == plantation.good_produced and game.good_supply.has? good_type
           refining_capacity.delete_at(j)
           game.good_supply.goods.find_and_move(goods){|good| good.class == good_type}
           break
         end
      end
    end
    
    goods
  end
  
  def production_buildings
    @production_buildings ||= @buildings.select{|building| building.class.superclass == ProductionBuilding}
  end
  
end