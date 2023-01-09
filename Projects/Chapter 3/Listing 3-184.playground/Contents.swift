
extension String.StringInterpolation {
   mutating func appendInterpolation(celsius value: Double) {
      let fahrenheit = ((value * 9)/5) + 32
      appendLiteral(String(fahrenheit))
   }
}
print("Temperature in Fahrenheit \(celsius: 25)")
