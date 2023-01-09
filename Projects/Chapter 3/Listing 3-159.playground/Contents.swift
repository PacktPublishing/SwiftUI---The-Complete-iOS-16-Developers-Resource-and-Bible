
class Employee {
   var name: String
   var age: Int
    
   init(name: String, age: Int) {
      self.name = name
      self.age = age
   }
}
class OfficeEmployee: Employee {
   var department: String = "Undefined"
}
let employee1 = OfficeEmployee(name: "George", age: 29)
