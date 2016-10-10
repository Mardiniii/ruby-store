require 'test/unit'
require_relative '../checkout.rb'
require_relative '../discount_rule.rb'
require_relative '../two_for_one_rule.rb'

class CheckoutTest < Test::Unit::TestCase

  def setup
    @rule_one = TwoForOneRule.new('VOUCHER')
    @rule_two = DiscountRule.new('TSHIRT', 3, 1.0)
    @checkout = Checkout.new([ @rule_one, @rule_two ])
    @store = @checkout.store
  end

  def test_when_checkout_scan_a_new_product
    assert_equal @checkout.scan("VOUCHER"), 'Added to car'
    assert_equal @checkout.scan("PEN"), 'Sorry, This product code does not exist'
    assert_equal @checkout.scan("TSHIRT"), 'Added to car'
    assert_equal @checkout.scan("MUG"), 'Added to car'
    assert_equal @checkout.scan("CAR"), 'Sorry, This product code does not exist'
  end

  def test_that_total_works_correcty_without_apply_promotions_and_invalid_codes
    @checkout.scan('TSHIRT')
    @checkout.scan('GLASSES')
    @checkout.scan('VOUCHER')
    @checkout.scan('INVITATION')
    @checkout.scan('MUG')
    assert_equal 32.5, @checkout.total
  end

  def test_checkout_example_one
    @checkout.scan('VOUCHER')
    @checkout.scan('TSHIRT')
    @checkout.scan('VOUCHER')
    assert_equal 25.0, @checkout.total
  end

  def test_checkout_example_two
    @checkout.scan('TSHIRT')
    @checkout.scan('TSHIRT')
    @checkout.scan('TSHIRT')
    @checkout.scan('VOUCHER')
    @checkout.scan('TSHIRT')
    assert_equal 81.0, @checkout.total
  end

  def test_checkout_example_three
    @checkout.scan('VOUCHER')
    @checkout.scan('TSHIRT')
    @checkout.scan('VOUCHER')
    @checkout.scan('VOUCHER')
    @checkout.scan('MUG')
    @checkout.scan('TSHIRT')
    @checkout.scan('TSHIRT')
    assert_equal 74.5, @checkout.total
  end
end
