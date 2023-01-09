
enum Number: Int {
   case one
   case two
   case three

   func getMessage() -> String {
      switch self {
         case .one:
            return "We are the best"
         case .two:
            return "We have to study more"
         case .three:
            return "This is just the beginning"
      }
   }
}
var mynumber = Number.two
print(mynumber.getMessage())  // "We have to study more"
