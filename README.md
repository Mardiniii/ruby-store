# Solution to Cabify Coding Exercise

Hi Cabify Team, in this repo I want to share my solution to the Ruby Coding Exercise. In this documentation you will find some explanations and considerations about the code.

## Class Diagram

This is the class diagram

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
