
enum Number {
   case one
   case two
   case three
}
var mynumber = Number.two

switch mynumber {
   case .one:
      print("The number is 1")
   case .two:
      print("The number is 2")  // "The number is 2"
   case .three:
      print("The number is 3")
}
