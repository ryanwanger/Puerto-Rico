class PuertoRico::Ship
  
  attr_accessor :slots
  attr_accessor :size
  
  def initialize size
    @slots = []
    @size = size
  end
  
  def available_slots
    size - slots.length
  end
  
  def full?
    available_slots == 0
  end
  
  def not_full?
    !full?
  end
  
end