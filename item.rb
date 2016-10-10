class Item
  attr_reader :code
  attr_accessor :price

  def initialize(code, price)
    @code, @price = code, price
  end
end