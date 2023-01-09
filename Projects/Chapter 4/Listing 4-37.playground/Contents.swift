
import Foundation

let length = Measurement(value: 40, unit: UnitLength.kilometers)
let text = length.formatted(.measurement(width: .wide, usage: .asProvided))
print(text)  // "40 kilometers"
