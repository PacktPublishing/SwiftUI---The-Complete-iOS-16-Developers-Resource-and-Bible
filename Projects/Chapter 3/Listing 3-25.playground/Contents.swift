
func processclosure(myclosure: (Int, Int) -> Int) {
   print("The total is: \(myclosure(10, 2))")  // "The total is: 20"
}
processclosure() { $0 * $1 }
