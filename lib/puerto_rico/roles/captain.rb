class PuertoRico::Captain < PuertoRico::Role
  
  def resolve game
    
    player = chooser
    
    while game.the_players.can_ship? do
      player.ship game
      player = player.next_player
    end
    
  end
  
  
  
end