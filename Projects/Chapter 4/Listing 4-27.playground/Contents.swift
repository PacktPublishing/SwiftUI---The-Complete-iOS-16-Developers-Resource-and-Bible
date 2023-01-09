
import Foundation

let calendar = Calendar.current

var components = DateComponents()
components.year = 1970
components.month = 8
components.day = 21
var birthday = calendar.date(from: components)

components.year = 2020
components.month = 8
components.day = 21
var future = calendar.date(from: components)

if birthday != nil && future != nil {
   let today = Date()
   let interval = DateInterval(start: birthday!, end: future!)
   if interval.contains(today) {
      print("You still have time")  // "You still have time"
   }
}
