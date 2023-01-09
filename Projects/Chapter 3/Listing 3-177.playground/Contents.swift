
struct Employees: Hashable {
   var name: String
   var age: Int
}
let employee1 = Employees(name: "John", age: 32)
let employee2 = Employees(name: "Robert", age: 55)

let list: Set<Employees> = [employee1, employee2]
for item in list {
   print(item.name)
}
