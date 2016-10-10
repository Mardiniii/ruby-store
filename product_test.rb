require 'test/unit'
require_relative 'product.rb'

class ProductTest < Test::Unit::TestCase

  def setup
    @code = 'VOUCHER'
    @name = 'Cabify Voucher'
    @price = 5.00
    @product = Product.new(@code, @name, @price)
  end

  def test_new_product
    assert_equal @code, @product.code, 'Product code is ok'
    assert_equal @name, @product.name, 'Product name is ok'
    assert_equal @price, @product.price, 'Product price is ok'
  end
end