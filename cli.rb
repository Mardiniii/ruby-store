require_relative 'lib/checkout.rb'
require_relative 'lib/discount_rule.rb'
require_relative 'lib/two_for_one_rule.rb'
require_relative 'lib/free_item_rule.rb'

# Print variables
def prompt
  print '> '
end

def breakline
  puts "\n"
end

# Initialize objects
@rule_one = TwoForOneRule.new('VOUCHER')
@rule_two = DiscountRule.new('TSHIRT', 3, 1.0)
@rule_three = FreeItemRule.new('MUG')
@checkout = Checkout.new([ @rule_one, @rule_two ])
# @checkout_with_free_mug = Checkout.new([ @rule_one, @rule_two, @rule_three ])
@store = @checkout.store

option = 0
while option != 6
  puts """
    Welcome to Cabify's Ruby Store

    1. Get Cabify's Store Inventory
    2. Find product
    3. Add new product
    4. Add product to checkout
    5. Calculate checkout total
    6. Exit
  """
  prompt

  option = gets.chomp.to_i
  case option
  when 1
    puts @store.list
  when 2
    breakline
    puts 'Please enter product code'
    prompt
    code = gets.chomp
    product = @store.find(code)
    breakline
    puts product.nil? ? 'Sorry, this product does not exist' : product.to_s
  when 3

  when 4

  when 5

  when 6
    breakline
    puts 'Bye bye user!'
  else
    breakline
    puts 'Please select a correct option'
  end
end