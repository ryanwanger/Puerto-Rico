# describe PlantationSupply do
#   
#   before(:each) do 
#     @plantation_supply = PlantationSupply.new
#     @player = Player.new 0
#   end
#   
#   it "should initialize with 58 tiles" do
#     @plantation_supply.size.should == 58
#   end
#   
#   it "should be able to transfer a specfic plantation" do
#     @plantation_supply.plantations.find_and_move(@player){|p| p.class == IndigoPlantation}
#     @player.island.plantations.first.class.should == IndigoPlantation
#     @plantation_supply.size.should == 57
#   end
#   
# end