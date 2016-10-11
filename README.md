# Solution to Cabify Ruby Code Challenge

Hi Cabify Team, in this repository I want to share my solution to the [Ruby Code Challenge](https://gist.github.com/patriciagao/377dca8920ba3b1fc8da). Here you will find some explanations and considerations about the code.

## Class Diagram

![Image of Class Diagram]
(http://i592.photobucket.com/albums/tt5/Mardini03/cabifys-store-diagram-edited.png)

This is the class diagram that I chose to solve the exercise. With this architecture it is possible to connect to a database and extend the store with more products or rules in a quick and easy way. The exercise is composed of the following classes:

### Product
This class contains the product information it has three attributes: code, name and price as well as two methods::

* ```to_s```: returns the product in a beautiful table.
* ```to_a```: returns product attributes values as an array ```[ @code, @name, @price ]```.

### Store

The store class is responsible of storing the products available in the store. Within this class you will find the ```@inventory``` attribute consisting of a hash of products, each product has the product key code as a symbol and value as an object from the class product. This class has methods such as:

* ```find``` returning a product from the store if exists or ```nil```.
* ```add_new_product``` this can extend the inventory creating a new product for the store.
* ```list``` that returns store's products in a fancy table and some other methods necessary for internal operations of the checkout process.

### Item

This class is associated with one checkout process. Each object from this class saves the code from one product in the store and a price attribute that can change depending of which promotion or discount rule is applied to the item.

### Rules

Departments are creating different discounts to implement in the store. Each promotion rule corresponds to one specific class, all of these classes must have a special characteristic and an ```apply``` method. This method will update the item's price depending on the values, rules and structure for each discount. The next rules are implemented in this repository:

1. **Discount rule:** If the checkout process has three or more T-shirts items, it will discount 1.0€ to each of them.

2. **Two for one rule:** On VOUCHER items, pay one take another for free.

3. **Free item rule:** I made this code with :heart: and I built this as a gift. This rule shows how easy it is to extend the pricing rules with a new discount program.

### Checkout

Checkout class is where the magic happens, this class has a special initialize method that receives a variable number of pricing rules. In this method the checkout process creates the initial products for Cabify's Store and builds a store object with them. Each checkout object has a set of items as an array. With this special configuration we can control the price for each item depending on the rules given to checkout's constructor. ```scan``` method makes a validation for the product code returning ```true```or ```false``` when searching for the product code in the store. ```total``` method calls each rule's ```apply``` method to update items price according to each rule configuration.

## Unit Test

This is production code, therefore I decided to include some unit test cases that you can check in the test folder for each class.

## CLI

In addition I built a Command Line Interface, run the cli.rb file and remember to install the [terminal-table gem](https://github.com/tj/terminal-table). You can find the next options at the CLI:

1. **Inventory:** Get all the products from the store.
2. **Find product:** Find a product given a specific code.
3. **Create product:** Create a new product for the store.
4. **Scan product:** Add a new item to checkout process.
5. **Total:** Get the total value for checkout process after applying all the rules.
6. **Exit:** Finish the program.