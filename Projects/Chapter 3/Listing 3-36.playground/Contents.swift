
struct Item {
   var name = "Not defined"
   var price = 0.0
}
var purchase = Item(name: "Lamp", price: 10.50)
print("Purchase: \(purchase.name) $ \(purchase.price)")
