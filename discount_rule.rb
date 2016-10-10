class DiscountRule
  def initialize(code, quantity, discount_per_item)
    @code = code
    @quantity = quantity
    @discount_per_item = discount_per_item
  end

  def apply(items)

  end
end