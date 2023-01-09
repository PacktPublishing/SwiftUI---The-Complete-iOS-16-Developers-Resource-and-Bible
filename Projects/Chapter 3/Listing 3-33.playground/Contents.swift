
struct Item {
   var name: String
   var price: Double
}
var purchase: Item = Item(name: "Lamps", price: 27.50)

let keyPrice = \Item.price
purchase[keyPath: keyPrice] = 30.00
print(purchase.price)
