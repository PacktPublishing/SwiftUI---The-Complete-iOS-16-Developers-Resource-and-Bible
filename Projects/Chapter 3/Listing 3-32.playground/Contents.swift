
struct Item {
   let name: String
   let price: Double
}
var purchase: Item = Item(name: "Lamps", price: 27.50)

let keyPrice = \Item.price
print(purchase[keyPath: keyPrice])  // "27.5"
