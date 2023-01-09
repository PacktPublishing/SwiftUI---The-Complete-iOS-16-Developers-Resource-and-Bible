
class Employee {
   private var name = "Undefined"
   public private(set) var age = 0

   func setAge(newAge: Int) {
      age = newAge
   }
}
let employee = Employee()
employee.setAge(newAge: 25)
print(employee.age)
