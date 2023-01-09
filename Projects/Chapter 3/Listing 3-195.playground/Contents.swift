
enum Errors: Error {
   case OutOfStock
}
struct Stock {
   var totalLamps = 5

   mutating func sold(amount: Int) -> Result<Int, Errors> {
      if amount > totalLamps {
         return .failure(.OutOfStock)
      } else {
         totalLamps = totalLamps - amount
         return .success(totalLamps)
      }
   }
}
var mystock = Stock()

let result = mystock.sold(amount: 2)
do {
   let stock = try result.get()
   print("Lamps in stock: \(stock)")
} catch Errors.OutOfStock {
   print("Error: Out of Stock")
}
