$LOAD_PATH << File.dirname(__FILE__) + "/lib"

class Runner
  
  def self.start
    @game = Game.new 3
    loop do
      @game.play_round
      if ending_condition = @game.over? then
        puts "Game over because of #{ending_condition}"
        break
      end
    end
  end
  
end