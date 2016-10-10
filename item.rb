class Item
  attr_accessor :code, :price

  def initialize(code, price)
    @code, @price = code, price
  end
end