
enum Errors: Error {
   case OutOfStock
}
struct Stock {
   var totalLamps = 5
   mutating func sold(amount: Int) throws {
      if amount > totalLamps {
         throw Errors.OutOfStock
      } else {
         totalLamps = totalLamps - amount
      }
   }
}
var mystock = Stock()
