
class Employee {
   lazy var name: String = {
      // Loading name from a server
      print("Loading...")

      return "Undefined"
   }()
   var age = 0
}
let employee = Employee()
