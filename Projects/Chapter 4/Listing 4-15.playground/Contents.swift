
import Foundation

let mynumber: Int = 32000000
let text = mynumber.formatted(.number.grouping(.never))
print(text)  // "32000000"
