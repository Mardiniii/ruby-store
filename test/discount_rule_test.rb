require 'test/unit'
require_relative '../discount_rule.rb'
require_relative '../checkout.rb'

class DiscountRuleTest < Test::Unit::TestCase
  def setup
    @rule = DiscountRule.new('TSHIRT', 3, 1.0)
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
    @mug_one = Item.new(@mug.code, @mug.price)
  end

  def test_rule_application_without_items_to_apply_discount
    items = [ @voucher_one, @mug_one ]
    @rule.apply(items)
    assert_equal @voucher_one.price, @voucher_one.price, "Item price didn't change"
    assert_equal @mug_one.price, @mug_one.price, "Item price didn't change"
  end

  def test_rule_application_without_enough_quantity_to_apply_discount
    items = [ @tshirt_one, @tshirt_two, @voucher_one, @mug_one ]
    @rule.apply(items)
    assert_equal @tshirt_one.price, @tshirt.price, "Item price didn't change"
    assert_equal @tshirt_two.price, @tshirt.price, "Item price didn't change"
    assert_equal @voucher_one.price, @voucher_one.price, "Item price didn't change"
    assert_equal @mug_one.price, @mug_one.price, "Item price didn't change"
  end

  def test_rule_application_with_the_minimun_quantity_to_apply_discount
    items = [ @tshirt_one, @tshirt_two, @tshirt_three, @voucher_one, @mug_one ]
    @rule.apply(items)
    discount_value = @rule.discount_per_item
    assert_equal @tshirt_one.price, @tshirt.price - discount_value, "Item price had discount"
    assert_equal @tshirt_two.price, @tshirt.price - discount_value, "Item price had discount"
    assert_equal @tshirt_three.price, @tshirt.price - discount_value, "Item price had discount"
    assert_equal @voucher_one.price, @voucher_one.price, "Item price didn't change"
    assert_equal @mug_one.price, @mug_one.price, "Item price didn't change"
  end

  def test_rule_application_with_more_than_the_quantity_necessary_to_apply_discount
    items = [ @tshirt_one, @tshirt_two, @tshirt_three, @tshirt_four, @tshirt_five, @voucher_one, @mug_one ]
    @rule.apply(items)
    discount_value = @rule.discount_per_item
    assert_equal @tshirt_one.price, @tshirt.price - discount_value, "Item price had discount"
    assert_equal @tshirt_two.price, @tshirt.price - discount_value, "Item price had discount"
    assert_equal @tshirt_three.price, @tshirt.price - discount_value, "Item price had discount"
    assert_equal @tshirt_four.price, @tshirt.price - discount_value, "Item price had discount"
    assert_equal @tshirt_five.price, @tshirt.price - discount_value, "Item price had discount"
    assert_equal @voucher_one.price, @voucher_one.price, "Item price didn't change"
    assert_equal @mug_one.price, @mug_one.price, "Item price didn't change"
  end
end