
import Foundation

let mydate = Date.now
let text = mydate.formatted(.dateTime.weekday(.wide))
print(text)  // "Friday"
