class PuertoRico::Player
  attr_accessor :name
  attr_accessor :doubloons
  attr_accessor :island
  attr_accessor :is_governor
  attr_accessor :next_player
  attr_accessor :city
  attr_accessor :colonists
  attr_accessor :goods
  
  def initialize player_number
    @name = "Player #{player_number}"
    @island = PuertoRico::Island.new
    @city = PuertoRico::City.new
    @colonists = []
    @goods = []
  end

  def << object
    case object
    when PuertoRico::Colonist
      colonists << object
    when PuertoRico::Building
      city << object
    when PuertoRico::Plantation
      island << object
    when PuertoRico::Good
      goods << object
    end
    
  end
  
  def choose_role game
    game.roles.each_with_index do |role, j|
      puts "Press #{j} for #{role.class.name} (#{role.doubloons} doubloons)" if role.not_chosen?
    end
    
    choice = gets.strip
    chosen_role = game.roles[choice.to_i]
    chosen_role.chooser = self
    chosen_role.award_bonus_doubloons
    chosen_role.resolve game
  end
  
  def available_city_slots
    @city.available_slots
  end
  
  def available_slots
    @city.available_slots + @island.available_slots
  end
    
  def has_colonists?
    @colonists.count > 0
  end
    
  def empty_all_slots
    @city.return_colonists self
    @island.return_colonists self
  end
  
  def cannot_place_more_colonists
    colonists.empty? || available_slots == 0
  end
  
  def current_quarry_discount
    island.occupied_quarries.length
  end
  
  def doubloons_remaining_after_purchasing building
    doubloons - building.adjusted_cost_for(self)
  end
  
  def goods_produced game
    goods_produced = []
    goods_produced += island.craft game
    goods_produced += city.craft game, self
    goods_produced
  end
  
  def can_ship? game
    goods.any?{|good| good.can_ship?(game, player)}
  end
  
  def ship game
    
  end
  
  def output_buildings_and_plantations
    @city.buildings.each do |building|
      puts "#{building.name} has #{building.colonist_count} colonists"
    end
    @island.plantations.each do |plantation|
      puts "#{plantation.good_produced} plantation has #{plantation.colonist_count} colonists"
    end
  end
  
end