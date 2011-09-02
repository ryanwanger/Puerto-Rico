class PuertoRico::Craftsman < PuertoRico::Role
  
  def resolve game
    player = chooser
    
    begin
      goods_produced = player.goods_produced game
      chooser_goods_produced = Array.new(goods_produced) if player == chooser
      puts "#{player.name} just crafted #{goods_produced.inspect}"
      while !goods_produced.empty?
        player.goods << goods_produced.shift
      end
      
      player = player.next_player
    end until player == chooser
    
    award_bonus_good game, chooser, chooser_goods_produced
  end
  
  def award_bonus_good game, player, goods_produced
    goods_produced.uniq.each_with_index do |good, j|
      puts "#{j}: Take a bonus #{good.class}" if game.good_supply.has? good.class
    end
    
    choice = gets.strip
    game.good_supply.goods.find_and_move(player){|good| good.class == goods_produced[choice.to_i].class}
  end
  
end