require 'test/unit'
require_relative '../product.rb'

class ProductTest < Test::Unit::TestCase

  def setup
    @code = 'VOUCHER'
    @name = 'Cabify Voucher'
    @price = 5.00
    @product = Product.new(@code, @name, @price)
  end

  def test_that_new_product_is_created_correctly
    assert_equal @code, @product.code, 'Product code is ok'
    assert_equal @name, @product.name, 'Product name is ok'
    assert_equal @price, @product.price, 'Product price is ok'
  end

  def test_array_conversion
    assert_equal [ @code, @name, @price], @product.to_a, 'Conversion to array is ok'
  end
end