
struct Employees {
   var name: String
   var age: Int
}
extension Employees {
   func printbadge() {
      print("Name: \(name) Age: \(age)")
   }
}
let employee = Employees(name: "John", age: 50)
employee.printbadge()  // "Name: John Age: 50"
