
struct Employees: Hashable {
   var name: String
   var age: Int

   func hash(into hasher: inout Hasher) {
      hasher.combine(name)
   }
}
let employee = Employees(name: "George", age: 32)
print(employee.hashValue)  // e.g., 7722685913545470055
