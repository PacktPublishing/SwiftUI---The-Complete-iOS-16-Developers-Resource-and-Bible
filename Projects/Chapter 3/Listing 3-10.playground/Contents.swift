
func first() {
   var number = 25
   second(value: &number)
   print("The result is \(number)")  // "The result is 50"
}
func second(value: inout Int) {
   value = value * 2
}
first()
