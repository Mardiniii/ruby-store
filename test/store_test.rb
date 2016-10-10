require 'test/unit'
require_relative '../lib/store.rb'

class StoreTest < Test::Unit::TestCase

  def setup
    voucher = Product.new('VOUCHER', 'Cabify Voucher', 5.0)
    tshirt = Product.new('TSHIRT', 'Cabify T-Shirt', 20.0)
    mug = Product.new('MUG', 'Cafify Coffee Mug', 7.5)
    @store = Store.new(voucher, tshirt, mug)
  end

  def test_that_quantity_of_products_is_correct
    assert_equal 3, @store.products_quantity, 'The store has 3 products'
  end

  def test_find_product_method
    product = @store.products.first
    assert_equal [ product.code, product.name, product.price], @store.find(product.code).to_a
    assert_equal nil, @store.find('Car')
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
    @store.products.each{ |product| codes.push(product.code) }
    assert_equal codes, valid_codes
  end
end