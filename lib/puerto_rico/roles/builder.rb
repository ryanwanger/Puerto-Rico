class PuertoRico::Builder < PuertoRico::Role
  
  def resolve game
    super game
    player = chooser
    
    begin 
      buy_building game, player
      player = player.next_player
    end until player == chooser
    
  end
  
  def buy_building game, player
    puts "#{player.name} can buy the following buildings:"
    game.building_supply.buildings.each_with_index do |building, j|
      puts "#{j}: Buy #{building.name}" if building.can_be_bought_by? player
    end
    puts "PASS: Buy nothing"
    
    choice = gets.strip
    
    case choice
    when "PASS"
      # do nothing!
    else
      building_purchased = game.building_supply.buildings.delete_at(choice.to_i)
      player << building_purchased
    end
    
  end
  
  
  
end