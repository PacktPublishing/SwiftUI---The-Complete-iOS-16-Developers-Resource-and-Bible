
import Foundation

let mynumber: Double = 32.56789
let text = mynumber.formatted(.number.precision(.fractionLength(2)))
print(text)  // "32.57"
