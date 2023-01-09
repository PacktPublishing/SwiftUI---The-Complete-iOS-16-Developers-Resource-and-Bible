
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

var countOffice = 0
var countWarehouse = 0

for obj in list {
   if obj is OfficeEmployee {
      countOffice += 1
   } else if obj is WarehouseEmployee {
      countWarehouse += 1
   }
}
print("We have \(countOffice) employees working at the office")  // 2
print("We have \(countWarehouse) employees working at the warehouse") //1
