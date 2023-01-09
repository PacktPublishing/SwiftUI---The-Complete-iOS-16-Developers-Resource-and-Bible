
protocol Printer {
   associatedtype protype
   var name: protype { get set }
}
struct Employees: Printer {
   var name: String
}
let employee = Employees(name: "John")
print(employee.name)  // "John"
