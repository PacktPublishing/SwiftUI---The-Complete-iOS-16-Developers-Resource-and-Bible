
struct Item {
   var name = "Not defined"
   var price = 0.0

   func total(quantity: Double) -> Double {
      return quantity * price
   }
}
var purchase = Item()
purchase.name = "Lamp"
purchase.price = 10.50

print("Total: \(purchase.total(quantity: 2))")  // "Total: 21.0"
