
enum MyCharacters {
   case number(Int, String)
   case letter(Character, String)
}
var character = MyCharacters.number(1, "Number One")

switch character {
   case .number(let value, let description):
      print("\(description) - \(value)")  // "Number One - 1"
   case .letter(let letter, let description):
      print("\(description) - \(letter)")
}
