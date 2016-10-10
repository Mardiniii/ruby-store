class Item
  attr_reader :code
  attr_writer :price

  def initialize(code, price)
    @code, @price = code, price
  end
end