
import Foundation

let calendar = Calendar.current
var comp = DateComponents()
comp.year = 1970
comp.month = 8
comp.day = 21

var birthday = calendar.date(from: comp)  // "Aug 21, 1970, 12:00 AM"
