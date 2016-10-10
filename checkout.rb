require_relative 'discount_rule'
require_relative 'store'
require_relative 'item'

class Checkout
  attr_reader :total, :store, :items

  def initialize(pricing_rules)
    @rules = pricing_rules
    @store = Store.new
    @items = []
    @valid_codes = @store.valid_codes
  end

  def scan(code)
    if @valid_codes.include?(code)
      product = @store.find(code)
      item = Item.new(product.code, product.price)
      @items.push(item)
      'Added to car'
    else
      'Sorry, This product code does not exist'
    end
  end

  def total
    @rules.each{ |rule| rule.apply(@items) }
    @items.inject(0.0){ |total, item| total += store.find(item.code).price}
  end
end
