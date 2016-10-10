# Solution to Cabify Coding Exercise

Hi Cabify Team, in this repository I want to share my solution to the Ruby Coding Exercise. In this documentation you will find some explanations and considerations about the code.

## Class Diagram

This is the class diagram that I chose to solve the exercise. With this architecture is possible to connect to a database and extend the store with more products or rules in fast and easy way. There are three main classes:

### Product
This class contain the product information it has three attributes code, name, price and two methods to_s returns the product in a beauty table and to_a that returns product attributes values as array

```ruby
[ @code, @name, @price ]
```

### Store

The store class is responsible for storing the products availables in the store, this class has a ```ruby @inventory``` attribute consisting of a hash of products, each product has the product key code as a symbol and as value an object from the class product. This class has methods such as:

* ```ruby find``` returning a product from the store if exist or ```ruby nil```.
* ```ruby add_new_product``` that can extend the inventory creating a new product for the store.
* ```ruby list``` that returns store's products in a fancy table and some other methods necessaries for internal operations of the checkout process.

### Checkout

![Image of Class Diagram]
(http://i592.photobucket.com/albums/tt5/Mardini03/cabifys-store-diagram-edited.png)


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
