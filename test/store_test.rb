require 'test/unit'
require_relative '../store.rb'

class StoreTest < Test::Unit::TestCase

  def setup
    @store = Store.new
  end

  def test_that_quantity_of_products_is_correct
    assert_equal 3, @store.products_quantity, 'The store has 3 products'
  end

  def test_find_product_method
    product = @store.products.first[1]
    assert_equal [ product.code, product.name, product.price], @store.find(product.code).to_a
    assert_equal "Sorry, this product does not exist", @store.find('Car')
  end

  def test_store_creates_a_new_product
    @store.add_product("SHIRT", "Awesome Shirt", 45)
    product = @store.find("SHIRT")
    assert_equal 4, @store.products_quantity, 'The store has 4 products'
    assert_equal [ product.code, product.name, product.price], @store.find(product.code).to_a
  end

  def test_valid_codes_method
    codes = []
    valid_codes = @store.valid_codes
    @store.products.values.each{ |product| codes.push(product.code) }
    assert_equal codes, valid_codes
  end
end