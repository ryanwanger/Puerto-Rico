class PuertoRico::Mayor < PuertoRico::Role
  
  def resolve game  
    award_bonus_colonist_to_chooser game
    distribute_colonists_from_ship game
    make_players_place_colonists game
    game.colonist_ship.refill game  
  end
  
  def award_bonus_colonist_to_chooser game
    chooser << game.colonist_supply.colonists.shift 
  end
  
  def distribute_colonists_from_ship game
    player = chooser
    
    until game.colonist_ship.empty? do
      player << game.colonist_ship.shift
      player = player.next_player
    end
  end
  
  def make_players_place_colonists game
    player = chooser
    
    begin 
      place_colonists game, player
      player = player.next_player
    end until player == chooser
  end
  
  def place_colonists game, player
    if player.available_slots == 0
      puts "#{player.name} has #{player.colonists.count} but nowhere to put them"
    else
      player.empty_all_slots
      
      until player.cannot_place_more_colonists

        print_placement_choices player
        choice = gets.strip

        case choice
        when "Q"
          player.island.add_colonist_to(:quarry, player)
        when "C"
          player.island.add_colonist_to(Corn, player)
        else
          building = player.city.buildings[choice.to_i]
          building << player.colonists.shift

          if building.kind_of? ProductionBuilding and building.has_available_plantation? player and player.has_colonists?

            player.island.add_colonist_to(building.good_produced, player)
          end
        end
      end     
    end
  end
  
  def print_placement_choices player
    player.city.buildings.each_with_index do |building, j|
      unless building.fully_occupied?
        if building.kind_of? ProductionBuilding and building.has_available_plantation? player and player.colonists.count >= 2
          puts "#{j}: Add 2 colonists to produce #{building.good_produced}"
        else
          puts "#{j}: Add a colonist to #{building.name}"
        end
      end
    end 
    
    puts "C: Add colonist to one of the #{player.island.unoccupied_corn_plantations.length} corn plantations." if player.island.unoccupied_corn_plantations.length > 0
    puts "Q: Add colonist to one of the #{player.island.unoccupied_quarries.length} quarries." if player.island.unoccupied_quarries.length > 0
  end
  
end