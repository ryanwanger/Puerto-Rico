class PuertoRico::Trader < PuertoRico::Role
  
  def resolve game
    
    player = chooser
    
    begin
      game.trading_house.print_trade_options game, player
      if game.trading_house.full?
        puts "The trading house is full."
      else
        get_choice_and_trade(game, player)
      end
      player = player.next_player
    end until player == chooser
    
    game.trading_house.clear if game.trading_house.full?
  end
  
  def get_choice_and_trade game, player
    choice = gets.strip
    
    unless choice == "PASS"
      player.goods.find_and_move(game.trading_house.spaces){|good| good.class.to_s == choice}
      player.doubloons += Kernel.const_get(choice).new.price
      player.doubloons += 1 if player == chooser
    end
  end
  
end