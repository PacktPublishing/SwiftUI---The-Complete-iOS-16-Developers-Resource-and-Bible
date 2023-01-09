
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

for obj in list {
   if let temp = obj as? OfficeEmployee {
      temp.deskNumber = 100
   } else if let temp = obj as? WarehouseEmployee {
      temp.area = "New Area"
   }
}
