
import Foundation

var currentdate = Date()
var nextday = Date(timeIntervalSinceNow: 24 * 60 * 60)
var tendays = Date(timeInterval: -10 * 24 * 3600, since: nextday)
