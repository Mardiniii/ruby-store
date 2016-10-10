require 'test/unit'
require_relative 'store'

class StoreTest < Test::Unit::TestCase

  def setup
    @store = Store.new
  end

  def test_that_quantity_of_products_is_correct
    assert_equal 3, @store.products_quantity, 'The store has 3 products'
  end

  def test_find_product_method
    product = @store.products.first[1]
    assert_equal [ product.code, product.name, product.price], @store.find(product.code).to_a, 'It found the product with the code "VOUNCHER"'
    assert_equal "Sorry, this product does not exist", @store.find('Car')
  end
end