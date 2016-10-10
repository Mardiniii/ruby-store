require 'test/unit'
require_relative '../lib/free_item_rule.rb'
require_relative '../lib/checkout.rb'

class FreeItemRuleTest < Test::Unit::TestCase
  def setup
    @rule = FreeItemRule.new('VOUCHER')
    @checkout = Checkout.new([@rule])
    @store = @checkout.store
    @voucher = @store.find('VOUCHER')
    @tshirt = @store.find('TSHIRT')
    @mug = @store.find('MUG')
    @tshirt_one = Item.new(@tshirt.code, @tshirt.price)
    @tshirt_two = Item.new(@tshirt.code, @tshirt.price)
    @tshirt_three = Item.new(@tshirt.code, @tshirt.price)
    @tshirt_four = Item.new(@tshirt.code, @tshirt.price)
    @tshirt_five = Item.new(@tshirt.code, @tshirt.price)
    @voucher_one = Item.new(@voucher.code, @voucher.price)
    @voucher_two = Item.new(@voucher.code, @voucher.price)
    @voucher_three = Item.new(@voucher.code, @voucher.price)
    @voucher_four = Item.new(@voucher.code, @voucher.price)
    @mug_one = Item.new(@mug.code, @mug.price)
  end

  def test_rule_application_without_items_to_apply_discount
    items = [ @tshirt_one, @mug_one ]
    @rule.apply(items)
    assert_equal @tshirt_one.price, @tshirt_one.price, "Item price didn't change"
    assert_equal @mug_one.price, @mug_one.price, "Item price didn't change"
  end

  def test_when_checkout_products_to_apply_free_item_rule
    items = [@tshirt_one, @tshirt_two, @voucher_one, @voucher_two, @mug_one]
    @rule.apply(items)
    assert_equal @tshirt_one.price, @tshirt.price, "Item price didn't change"
    assert_equal @tshirt_two.price, @tshirt.price, "Item price didn't change"
    assert_equal @voucher_one.price, 0, "Item price now is zero"
    assert_equal @voucher_two.price, 0, "Item price now is zero"
    assert_equal @mug_one.price, @mug_one.price, "Item price didn't change"
  end

  def test_when_checkout_has_an_odd_number_of_products_to_apply_two_for_one_discount
    items = [@tshirt_one, @tshirt_two, @voucher_one, @voucher_two, @voucher_three, @mug_one]
    @rule.apply(items)
    assert_equal @tshirt_one.price, @tshirt.price, "Item price didn't change"
    assert_equal @tshirt_two.price, @tshirt.price, "Item price didn't change"
    assert_equal @voucher_one.price, 0, "Item price now is zero"
    assert_equal @voucher_two.price, 0, "Item price now is zero"
    assert_equal @voucher_three.price, 0, "Item price now is zero"
    assert_equal @mug_one.price, @mug_one.price, "Item price didn't change"
  end
end
