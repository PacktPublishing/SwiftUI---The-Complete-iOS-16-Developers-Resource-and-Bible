
import Foundation

let id = Calendar.Identifier.gregorian
let calendar = Calendar(identifier: id)
var comp = DateComponents()
comp.day = 120

var today = Date()
var appointment = calendar.date(byAdding: comp, to: today)
