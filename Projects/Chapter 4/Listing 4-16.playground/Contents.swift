
import Foundation

let mynumber: Int = 32000000
let text = mynumber.formatted(.number.sign(strategy: .always(includingZero: false)))
print(text)  // "+32,000,000"
