
let multiplier = { (number: Int, times: Int) -> Int in
   let total = number * times
   return total
}
print("The result is \(multiplier(10, 5))")  // "The result is 50"
