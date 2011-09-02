class PuertoRico::GameEndingCondition
  def self.inherited klass
    return unless klass.instance_of? Class
    self.children << klass
  end
  
  def self.children
    unless defined? @children
      @children = []
    end
    return @children
  end
  
  def game_over? game
    
  end
  
end