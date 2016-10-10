require 'test/unit'
require_relative 'store'

class StoreTest < Test::Unit::TestCase

  def setup
    @store = Store.new
  end

  def test_that_quantity_of_products_is_correct
    assert_equal 3, @store.products_quantity, 'The store has 3 products'
  end
end