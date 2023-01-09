
protocol Printer {
   var name: String { get set }
   func printdescription()
}
struct Employees: Printer {
   var name: String
   var age: Int
    
   func printdescription() {
      print("Description: \(name) \(age)")  // "Description: John 32"
   }
}
let employee1 = Employees(name: "John", age: 32)
employee1.printdescription()
