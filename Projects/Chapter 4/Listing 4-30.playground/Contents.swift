
import Foundation

let mydate = Date.now
let text = mydate.formatted(.dateTime.day().hour().month(.wide))
print(text)  // "June 18, 6 PM"
