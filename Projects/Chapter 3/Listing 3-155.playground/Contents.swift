
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

let myarea = (list[1] as! WarehouseEmployee).area
print("The area of employee 1 is \(myarea)")  // "Undefined"
