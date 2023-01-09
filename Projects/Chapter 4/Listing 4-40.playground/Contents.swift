
import Foundation

let length = Measurement(value: 40, unit: UnitLength.kilometers)
let chinaLocale = Locale(identifier: "zh_CN")
var format = Measurement<UnitLength>.FormatStyle(width: .wide, locale: chinaLocale, usage: .asProvided)
let text = length.formatted(format)
print(text)  // "40.00公里"
