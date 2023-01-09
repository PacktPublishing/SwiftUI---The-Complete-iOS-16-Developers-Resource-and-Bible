
struct Employees: Equatable {
   var name: String
   var age: Int

   static func == (value1: Employees, value2: Employees) -> Bool {
      return value1.age == value2.age
   }
}
let employee1 = Employees(name: "John", age: 32)
let employee2 = Employees(name: "George", age: 32)

let message = employee1 == employee2 ? "Equal" : "Different"
print(message)  // "Equal"
