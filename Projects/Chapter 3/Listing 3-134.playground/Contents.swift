
enum Number: String {
   case one = "Number One"
   case two = "Number Two"
   case three = "Number Three"
}
var mynumber = Number(rawValue: "Number Two")

if mynumber == .two {
   print("Correct Value")  // "Correct Value"
}
