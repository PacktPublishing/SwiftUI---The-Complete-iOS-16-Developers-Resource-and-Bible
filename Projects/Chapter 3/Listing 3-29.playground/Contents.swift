
struct Item {
   var name = "Not defined"
   var price = 0.0
}
var purchase = Item()
purchase.name = "Lamps"
purchase.price = 10.50

print("Product: \(purchase.name) $ \(purchase.price)")
