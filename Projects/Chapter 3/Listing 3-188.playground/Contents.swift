
struct Stock {
   var totalLamps = 5
   mutating func sold(amount: Int) {
      totalLamps = totalLamps - amount
   }
}
var mystock = Stock()

mystock.sold(amount: 8)
print("Lamps in stock: \(mystock.totalLamps)")  // "Lamps in stock: -3"
