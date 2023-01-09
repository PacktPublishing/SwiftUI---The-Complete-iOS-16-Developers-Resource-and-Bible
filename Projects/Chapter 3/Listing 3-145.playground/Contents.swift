
class Employee {
   var name: String?
   var location: Department?
}
class Department {
   var area: String?
   weak var person: Employee?
}
var employee: Employee? = Employee()
var department: Department? = Department()

employee?.name = "John"
employee?.location = department

department?.area = "Mail"
department?.person = employee
