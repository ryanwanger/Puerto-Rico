class PuertoRico::SpecialBuilding < PuertoRico::Building
  
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
  
end
