
import Foundation

let mynumber: Double = 32.56789
let text = mynumber.formatted(.number.precision(.fractionLength(2)).rounded(rule: .down))
print(text)  // "32.56"
