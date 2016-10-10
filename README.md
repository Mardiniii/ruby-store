# Solution to Cabify Coding Exercise

Hi Cabify Team, in this repository I want to share my solution to the Ruby Coding Exercise. In this documentation you will find some explanations and considerations about the code.

## Class Diagram

![Image of Class Diagram]
(http://i592.photobucket.com/albums/tt5/Mardini03/cabifys-store-diagram-edited.png)

This is the class diagram that I chose to solve the exercise. With this architecture is possible to connect to a database and extend the store with more products or rules in fast and easy way. There are the next classes:

### Product
This class contain the product information it has three attributes code, name, price and two methods:

* ```ruby to_s```: returns the product in a beauty table.
* ```ruby to_a```: returns product attributes values as array ```ruby [ @code, @name, @price ]```.

### Store

The store class is responsible for storing the products availables in the store, this class has a ```ruby @inventory``` attribute consisting of a hash of products, each product has the product key code as a symbol and as value an object from the class product. This class has methods such as:

* ```ruby find``` returning a product from the store if exist or ```ruby nil```.
* ```ruby add_new_product``` that can extend the inventory creating a new product for the store.
* ```ruby list``` that returns store's products in a fancy table and some other methods necessaries for internal operations of the checkout process.

### Item

This class is associated with one checkout process. Each object from this class saves the code from one product in the store and a price attribute that can change depending of wich promotion or discount rule is applied to the item.

### Rules

Departments are creating differents discounts to implement in the store. Each promotion rules corresponding to one specific class, all this classes must have an special carachteristic, an ```ruby apply``` method, this method will update the item's price depending on the values, rules and structure for each discount. The next rules are implemented in this repository:

1. Discount Rule: If the checkout process have three or more T-shirts items, it will discount 1.0€ to each of them.

2. Two For One Rule: On VOUCHER items, pay one take another free.

3. Free Item Rule: I made this code with :heart: and I build this as a give. This rule shows how easy is to extend the princing rules with a new discount program.

### Checkout

Checkout class is where the magic happens, this class have an special ```ruby initialize``` method that receives a variable number of princing rules, in this method the checkout process create the initial products for Cabify's Store and build a store object with them. Each checkout object have a set of items as array. With this special configuration we can control the price for each item depending on the rules given to checkout's constructor. ```ruby scan``` method makes a validation for the product code returning ```ruby true```or ```ruby false``` if finds the product code in the store. ```ruby total`` method calls each rule's ```ruby apply``` method to update items price acording to each rule configuration.

## Unit Test

This is production code, so I decided to include some unit test cases that you can check in the test folder for each class.

## CLI

Also I build a CLI run the cli.rb file and remember to install the [terminal-table gem](https://github.com/tj/terminal-table).

```
Code         | Name                |  Price
-------------------------------------------------
VOUCHER      | Cabify Voucher      |   5.00€
TSHIRT       | Cabify T-Shirt      |  20.00€
MUG          | Cafify Coffee Mug   |   7.50€
```

```ruby
co = Checkout.new(pricing_rules)
co.scan("VOUCHER")
co.scan("VOUCHER")
co.scan("TSHIRT")
price = co.total
```
