
protocol Printer {
   var name: String { get set }
}
extension Printer {
   func printdescription() {
      print("The name is \(name)")
   }
}
struct Employees: Printer {
   var name: String
   var age: Int
}
struct Offices: Printer {
   var name: String
   var employees: Int
}
let employee = Employees(name: "John", age: 45)
let office = Offices(name: "Mail", employees: 2)

employee.printdescription()  // "The name is John"
office.printdescription()  // "The name is Mail"
