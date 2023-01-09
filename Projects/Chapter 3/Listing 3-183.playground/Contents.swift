
struct Employees<T> {
   var value: T
}
extension Employees where T == Int {
   func doubleValue() {
      print("\(value) times 2 = \(value * 2)")
   }
}
let employee = Employees(value: 25)
employee.doubleValue()  // "25 times 2 = 50"
