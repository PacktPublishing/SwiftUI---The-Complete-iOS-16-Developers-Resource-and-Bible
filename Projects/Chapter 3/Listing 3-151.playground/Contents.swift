
class Employee {
   var name = "Undefined"
   var age = 0
}
class OfficeEmployee: Employee {
   var deskNumber = 0
}
class WarehouseEmployee: Employee {
   var area = "Undefined"
}
var list: [Employee] = [OfficeEmployee(), WarehouseEmployee(), OfficeEmployee()]
