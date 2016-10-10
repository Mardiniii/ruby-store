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

  def test_that_total_works_correcty
    @checkout.scan('VOUCHER')
    @checkout.scan('GLASSES')
    @checkout.scan('INVITATION')
    @checkout.scan('TSHIRT')
    @checkout.scan('MUG')
    @checkout.scan('GLASSES')
    @checkout.scan('MUG')
    @checkout.scan('VOUCHER')
    @checkout.scan('MUG')
    @checkout.scan('VOUCHER')
    @checkout.scan('PEN')
    assert_equal 57.5, @checkout.total
  end
end