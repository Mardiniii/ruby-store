require 'terminal-table'
require_relative 'product'
require 'byebug'

class Store
  attr_reader :products

  def initialize(*args)
    @inventory = args.map{ |product| [product.code.to_sym, product] }.to_h
  end

  def find(code)
    @inventory[code.to_sym]
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
    @inventory.values.map(&:code)
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
