require 'test/unit'
require_relative '../lib/checkout.rb'
require_relative '../lib/discount_rule.rb'
require_relative '../lib/two_for_one_rule.rb'
require_relative '../lib/free_item_rule.rb'

class CheckoutTest < Test::Unit::TestCase

  def setup
    @rule_one = TwoForOneRule.new('VOUCHER')
    @rule_two = DiscountRule.new('TSHIRT', 3, 1.0)
    @rule_three = FreeItemRule.new('MUG')
    @checkout = Checkout.new([ @rule_one, @rule_two ])
    @checkout_with_free_mug = Checkout.new([ @rule_one, @rule_two, @rule_three ])
    @store = @checkout.store
  end

  def test_when_checkout_scan_a_new_product
    assert_equal @checkout.scan("VOUCHER"), true
    assert_equal @checkout.scan("PEN"), false
    assert_equal @checkout.scan("TSHIRT"), true
    assert_equal @checkout.scan("MUG"), true
    assert_equal @checkout.scan("CAR"), false
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

  def test_checkout_example_four_with_free_item_rule_for_mugs
    @checkout_with_free_mug.scan('VOUCHER')
    @checkout_with_free_mug.scan('TSHIRT')
    @checkout_with_free_mug.scan('VOUCHER')
    @checkout_with_free_mug.scan('VOUCHER')
    @checkout_with_free_mug.scan('MUG')
    @checkout_with_free_mug.scan('MUG')
    @checkout_with_free_mug.scan('MUG')
    @checkout_with_free_mug.scan('MUG')
    @checkout_with_free_mug.scan('TSHIRT')
    @checkout_with_free_mug.scan('TSHIRT')
    assert_equal 67, @checkout_with_free_mug.total
  end
end
