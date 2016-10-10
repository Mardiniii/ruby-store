require 'test/unit'
require_relative '../checkout.rb'

class CheckoutTest < Test::Unit::TestCase

  def setup
    @checkout = Checkout.new([])
    @store = @checkout.store
  end

  def test_when_checkout_scan_a_new_product
    assert_equal @checkout.scan("VOUCHER"), 'Added to car'
    assert_equal @checkout.scan("PEN"), 'Sorry, This product code does not exist'
    assert_equal @checkout.scan("TSHIRT"), 'Added to car'
    assert_equal @checkout.scan("MUG"), 'Added to car'
    assert_equal @checkout.scan("CAR"), 'Sorry, This product code does not exist'
  end
end