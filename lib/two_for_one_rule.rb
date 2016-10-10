class TwoForOneRule
  def initialize(code)
    @code = code
  end

  def apply(items)
    selected_items = items.select{ |i| i.code == @code}
    if selected_items.size >= 2
      selected_items.each_slice(2) do |item, item_free|
        item_free.price = 0 unless item_free.nil?
      end
    end
  end
end
