
func doubleValue(number: Int) -> Int {
   guard number < 10 else {
      return number
   }
   return number * 2
}
let result = doubleValue(number: 25)
let message = "The result is \(result)"  // "The result is 25"
