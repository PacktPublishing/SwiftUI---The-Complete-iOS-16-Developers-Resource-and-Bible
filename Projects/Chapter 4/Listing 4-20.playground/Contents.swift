
import Foundation

var days = 7

var today = Date()
var event = Date(timeIntervalSinceNow: Double(days) * 24 * 3600)

if today.compare(event) == .orderedAscending {
   let interval = event.timeIntervalSince(today)
   print("We have to wait \(interval) seconds")
}
