
struct Employees: Comparable {
   var name: String
   var age: Int

   static func > (value1: Employees, value2: Employees) -> Bool {
      return value1.age > value2.age
   }
   static func < (value1: Employees, value2: Employees) -> Bool {
      return value1.age < value2.age
   }
   static func >= (value1: Employees, value2: Employees) -> Bool {
      return value1.age >= value2.age
   }
   static func <= (value1: Employees, value2: Employees) -> Bool {
      return value1.age <= value2.age
   }
}
let employee1 = Employees(name: "George", age: 32)
let employee2 = Employees(name: "Robert", age: 55)

if employee1 > employee2 {
   print("\(employee1.name) is older")
} else {
   print("\(employee2.name) is older")  // "Robert is older"
}
