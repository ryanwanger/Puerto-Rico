# Dir["*.rb"].each {|file| require file }
# Dir["*/*.rb"].each {|file| require file }

class PuertoRico::Game
  attr_accessor :number_of_players
  attr_accessor :victory_point_supply
  attr_accessor :building_supply
  attr_accessor :rounds_played
  attr_accessor :colonist_supply
  attr_accessor :colonist_ship
  attr_accessor :roles
  attr_accessor :plantation_supply
  attr_accessor :trading_house
  attr_accessor :good_supply
  attr_accessor :the_players
  attr_accessor :players
  attr_accessor :ships
  
  def initialize player_count
    @rounds_played = 0
    @number_of_players = player_count
    @plantation_supply = PuertoRico::PlantationSupply.new
    
    @the_players = PuertoRico::Players.new self
    
    @victory_point_supply = PuertoRico::VictoryPointSupply.new self
    @colonist_supply = PuertoRico::ColonistSupply.new self
    @colonist_ship = PuertoRico::ColonistShip.new self
    @building_supply = PuertoRico::BuildingSupply.new
    @roles = [PuertoRico::Prospector.new, PuertoRico::Mayor.new, PuertoRico::Builder.new, PuertoRico::Craftsman.new, PuertoRico::Trader.new]
    @trading_house = PuertoRico::TradingHouse.new
    @good_supply = PuertoRico::GoodSupply.new
    
    @ships = []
    case player_count
    when 3
      @ships << PuertoRico::Ship.new(4) << PuertoRico::Ship.new(5) << PuertoRico::Ship.new(6)
    when 4
      @ships << PuertoRico::Ship.new(5) << PuertoRico::Ship.new(6) << PuertoRico::Ship.new(7)
    when 5
      @ships << PuertoRico::Ship.new(6) << PuertoRico::Ship.new(7) << PuertoRico::Ship.new(8)
    end
  end
  
  def players
    @the_players.players
  end
  
  def over?
    PuertoRico::GameEndingConditions.children.each do |child|
      return child if child.game_over?( self )
    end
    return false
  end
  
  def governor
    the_players.governor
  end
  
  def play_round
    current_chooser = governor
    
    begin 
      puts "#{current_chooser.name}: you're up!"
      current_chooser.choose_role self
      current_chooser = current_chooser.next_player
    end until current_chooser == governor
    
    end_round
  end
  
  def end_round
    add_bonus_doubloons
    return_roles
    the_players.advance_governor
    @rounds_played += 1
  end
  
  def add_bonus_doubloons
    @roles.each do |role|
      role.doubloons += 1 if role.not_chosen?
    end
  end
  
  def return_roles
    @roles.each {|role| role.chooser = nil}
  end
  
end