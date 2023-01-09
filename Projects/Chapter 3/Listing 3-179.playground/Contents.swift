
enum Departments: CaseIterable {
   case mail
   case marketing
   case managing
}
var message = ""
for department in Departments.allCases {
   message += "\(department) "
}
print(message)  // "mail marketing managing "
