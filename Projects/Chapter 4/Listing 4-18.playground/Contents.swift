
import Foundation

let mynumber: Double = 32.55
let text = mynumber.formatted(.currency(code: "CAD"))
print(text)  // "CA$32.55"
