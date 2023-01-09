
class Employee {
   var name: String
   var age: Int
    
   init(name: String, age: Int) {
      self.name = name
      self.age = age
   }
}
class OfficeEmployee: Employee {
   var department: String
    
   init(name: String, age: Int, department: String) {
      self.department = department
        
      super.init(name: name, age: age)
   }
}
let employee1 = OfficeEmployee(name: "John", age: 24, department: "Mail")
