Array.module_eval do

  def move(other_array, obj)
    other_array << obj
    self.delete_at(self.index(obj))
  end
  
  def find_and_move(other_array, &blk)
    object_to_move = self.detect{|obj| blk.call(obj)}
    index = self.index(object_to_move)
    other_array << object_to_move
    self.delete_at(index)
  end
  
end
