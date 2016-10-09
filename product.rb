class Product
  attr_reader :code, :name, :price

  def initializa(code, name, price)
    @code = code
    @name = name
    @price = price
  end
end