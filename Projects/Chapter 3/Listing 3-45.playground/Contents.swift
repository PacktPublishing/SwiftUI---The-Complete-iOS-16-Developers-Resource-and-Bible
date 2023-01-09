
struct Price {
   var increment: Double = 0
   var oldprice: Double = 0

   var price: Double {
      willSet {
         increment = newValue - price
      }
      didSet {
         oldprice = oldValue
      }
   }
}
var product = Price(price: 15.95)
product.price = 20.75
print("New price: \(product.price)")  // "New price: 20.75"
print("Old price: \(product.oldprice)")  // "Old price: 15.95"
