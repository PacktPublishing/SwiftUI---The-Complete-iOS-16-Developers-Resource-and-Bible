
struct Employees: Equatable {
   var name: String
   var age: Int
}
let employee1 = Employees(name: "John", age: 32)
let employee2 = Employees(name: "George", age: 32)

let message = employee1 == employee2 ? "Equal" : "Different"
print(message)  // "Different"
