# describe PuertoRico::Game do
#   
#   before(:each) do
#     @game = Game.new 3
#   end
#   
#   it "should give out the correct starting plantations" do
#     case @game.the_players.count
#     when 3
#       @game.players[0].island.plantations.should.eql? [IndigoPlantation.new]
#       @game.players[1].island.plantations.should.eql? [IndigoPlantation.new]
#       @game.players[2].island.plantations.should.eql? [CornPlantation.new]
#       @game.plantation_supply.size.should == 55
#     end
#   end
#   
# end