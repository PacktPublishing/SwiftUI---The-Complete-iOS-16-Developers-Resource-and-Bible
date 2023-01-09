
struct Item {
   var name = "Not defined"
   var price = 0.0

   mutating func changename(newname: String) {
      name = newname
   }
}
var purchase = Item()
purchase.changename(newname: "Lamps")

print("Product: \(purchase.name)")  // "Product: Lamps"
