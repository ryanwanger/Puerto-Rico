class PuertoRico::Players
  
  attr_accessor :players
  
  def initialize game
    @players = []
    (1..game.number_of_players).each do |player_number|
      @players << PuertoRico::Player.new(player_number)
    end
    game.plantation_supply.plantations.find_and_move(@players[0]){|p| p.class == PuertoRico::IndigoPlantation}
    puts game.plantation_supply.plantations.length
    game.plantation_supply.plantations.find_and_move(@players[1]){|p| p.class == PuertoRico::IndigoPlantation}
    
    case game.number_of_players
    when 3
      @players.each {|p| p.doubloons = 2}
      game.plantation_supply.plantations.find_and_move(@players[2]){|p| p.class == PuertoRico::CornPlantation}
    when 4
      @players.each {|p| p.doubloons = 3}
      game.plantation_supply.plantations.find_and_move(@players[2]){|p| p.class == PuertoRico::CornPlantation}
      game.plantation_supply.plantations.find_and_move(@players[3]){|p| p.class == PuertoRico::CornPlantation}
    when 5
      @players.each {|p| p.doubloons = 4}
      game.plantation_supply.plantations.find_and_move(@players[2]){|p| p.class == PuertoRico::IndigoPlantation}
      game.plantation_supply.plantations.find_and_move(@players[3]){|p| p.class == PuertoRico::CornPlantation}
      game.plantation_supply.plantations.find_and_move(@players[4]){|p| p.class == PuertoRico::CornPlantation}
    end
    
    @players[0].is_governor = true

    turn_players_into_linked_list
  end
  
  def turn_players_into_linked_list
    @players.each_with_index do |player, j|
      if j == @players.length - 1
        next_player = 0
      else
        next_player = j + 1
      end
      player.next_player = @players[next_player]
    end
  end
  
  def available_city_slots
    sum = 0
    @players.each do |player|
      sum += player.city.available_slots
    end
    sum
  end
  
  def governor
    @players.detect{|player| player.is_governor}
  end
  
  def advance_governor
    new_governor = governor.next_player
    governor.is_governor = false
    new_governor.is_governor = true
  end
  
  def can_ship?
    @players.select{|player| player.can_ship?}.length > 0
  end
  
end