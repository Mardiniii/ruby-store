require 'terminal-table'

class Product
  attr_reader :code, :name, :price

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end

  def to_s
    product = [ @code, @name, @price ]
    table = Terminal::Table.new(headings: ['Code', 'Name', 'Price'], rows: [ product ])
  end

  def to_a
    [ @code, @name, @price ]
  end
end

