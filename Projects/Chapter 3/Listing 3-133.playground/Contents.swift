
enum Number: String {
   case one = "Number One"
   case two = "Number Two"
   case three = "Number Three"
}
var mynumber = Number.one
print("The value is \(mynumber.rawValue)")  // "The value is Number One"
