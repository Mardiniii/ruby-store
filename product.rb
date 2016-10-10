require 'terminal-table'

class Product
  attr_reader :code, :name, :price

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end

  def to_s
    table = Terminal::Table.new(headings: ['Code', 'Name', 'Price'], rows: [ product.to_a ])
  end

  def to_a
    [ @code, @name, @price ]
  end
end

