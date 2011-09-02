class PuertoRico::Prospector < PuertoRico::Role
  
  def resolve game
    chooser.doubloons += 1
    puts "#{chooser.name} got the bonus doubloon from the prospector"
  end
  
end