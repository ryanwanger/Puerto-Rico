class PuertoRico::GoodSupply
  
  attr_accessor :goods
  
  PuertoRico::Good.children.each do |child|
    define_method("has_#{child.name.to_s.downcase}?".to_sym) do
      has? child
    end
  end
  
  def initialize
    @goods = []
    PuertoRico::Good.children.each do |child|
      child.count.times {@goods << child.new}
    end
  end
  
  def has? good_type
    goods.any?{|good| good.class == good_type}
  end
  
  def size
    @goods.size
  end
  
  # def index_of_first good_type
  #   where = 0
  #   goods.each_with_index do |good, j|
  #     where = j if good.class == good_type
  #   end
  #   where
  # end
  #   
  # def move good, object
  #   if has? good.class
  #     object << goods.delete_at(index_of_first good.class)
  #   end
  # end
  
end