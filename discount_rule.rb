class DiscountRule
  attr_accessor :discount_per_item

  def initialize(code, quantity, discount_per_item)
    @code = code
    @quantity = quantity
    @discount_per_item = discount_per_item
  end

  def apply(items)
    selected_items = items.select{ |i| i.code == @code}
    selected_items.each{ |item| item.price -= @discount_per_item } if selected_items.size >= @quantity
  end
end