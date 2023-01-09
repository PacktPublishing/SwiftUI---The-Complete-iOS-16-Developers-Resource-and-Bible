
let multiplier = { (number: Int, times: Int) -> Int in
   let total = number * times
   return total
}
func processclosure(myclosure: (Int, Int) -> Int) {
   let total = myclosure(10, 2)
   print("The total is: \(total)")  // "The total is: 20"
}
processclosure(myclosure: multiplier)
