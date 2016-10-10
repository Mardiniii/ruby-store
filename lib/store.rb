require 'terminal-table'
require_relative 'product'
require 'byebug'

class Store
  attr_reader :products

  def initialize
    @inventory = {
      'VOUCHER': Product.new('VOUCHER', 'Cabify Voucher', 5.0),
      'TSHIRT': Product.new('TSHIRT', 'Cabify T-Shirt', 20.0),
      'MUG': Product.new('MUG', 'Cafify Coffee Mug', 7.5)
    }
  end

  def find(code)
    return @inventory[code.to_sym] if @inventory.key?(code.to_sym)
    nil
  end

  def add_product(code, name, price)
    product = Product.new(code, name, price)
    @inventory[code.to_sym] = product
  end

  def list
    Terminal::Table.new(title: "Cabify's Store", headings: [ 'Code', 'Name', 'Price'], rows: to_a)
  end

  def products_quantity
    @inventory.size
  end

  def products
    @inventory.values
  end

  # Returns an array with all the product codes
  def valid_codes
    @inventory.values.map{ |p| p.code }
  end

  private
  # Returns all the products as array of arrays
  def to_a
    products = []
    @inventory.each do |code, product|
      products.push(product.to_a)
    end
    products
  end
end
