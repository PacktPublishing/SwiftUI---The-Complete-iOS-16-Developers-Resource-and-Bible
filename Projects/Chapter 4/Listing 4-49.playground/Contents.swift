
import RegexBuilder

let regex = Regex {
   "Name:"
   OneOrMore(.whitespace)
   Capture {
      One(CharacterClass("A"..."Z"))
      OneOrMore {
         CharacterClass("a"..."z")
      }
   }
}
let message = "Name: John"
let result = message.matches(of: regex)
if let name = result.first?.output.1 {
   print("The name is: \(name)")  // "The name is: John"
}
