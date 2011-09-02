# describe Island do
#   
#   before(:each) do
#     @island = Island.new
#   end
#   
#   it "should be able to receive plantations" do
#     @island << IndigoPlantation.new
#     @island.plantations.count.should == 1
#   end
#   
#   it "should be able to add a colonist to a plantation" do
#     @island << IndigoPlantation.new
#     @island << CornPlantation.new
#     
#     @player = Player.new 0
#     @player << Colonist.new
#     @island.add_colonist_to Corn, @player
#   end
#   
# end