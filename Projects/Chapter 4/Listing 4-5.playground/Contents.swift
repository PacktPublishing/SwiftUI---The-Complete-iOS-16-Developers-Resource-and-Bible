
import Foundation

let length = 12.3472
let total = 54
let decimals = String.localizedStringWithFormat("Decimals: %.2f", length)
let digits = String.localizedStringWithFormat("Digits: %.5d", total)
print(decimals)  // "Decimals: 12.35"
print(digits)  // "Digits: 00054"
