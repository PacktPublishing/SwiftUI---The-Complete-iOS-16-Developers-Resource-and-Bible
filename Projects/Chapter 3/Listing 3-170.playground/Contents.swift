
protocol Printer {
   var name: String { get set }
   func printdescription()
}
struct Employees: Printer {
   var name: String
   var age: Int
    
   func printdescription() {
      print("Description: \(name) \(age)")
   }
}
struct Offices: Printer {
   var name: String
   var employees: Int
    
   func printdescription() {
      print("Description: \(name) \(employees)") // "Description: Mail 2"
   }
}
func getFile(type: Int) -> Printer {
   var data: Printer!
   if type == 1 {
      data = Employees(name: "John", age: 32)
   } else if type == 2 {
      data = Offices(name: "Mail", employees: 2)
   }
   return data
}
let file = getFile(type: 1)
file.printdescription()  // "Description: John 32"
