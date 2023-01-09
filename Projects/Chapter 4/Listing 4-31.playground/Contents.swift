
import Foundation

let mydate = Date.now
let chinaLocale = Locale(identifier: "zh_CN")
let text = mydate.formatted(.dateTime.locale(chinaLocale).day().month().year())
print(text)  // "2021年6月18日"
