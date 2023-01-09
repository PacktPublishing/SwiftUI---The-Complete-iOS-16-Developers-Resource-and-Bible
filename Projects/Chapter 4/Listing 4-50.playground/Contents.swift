
import RegexBuilder

let message = "09 units, stock 190"
let regex = Regex {
   Capture {
      OneOrMore(.digit)
   } transform: { value in
      Int(value)
   }
   OneOrMore(.any, .reluctant)
   Capture {
      OneOrMore(.digit)
   } transform: { value in
      Int(value)
   }
}
let result = message.matches(of: regex)
if let units = result.first?.output.1, let stock = result.first?.output.2 {
   let total = units + stock
   print("Final Stock: \(total)")  // "Final Stock: 199"
}
