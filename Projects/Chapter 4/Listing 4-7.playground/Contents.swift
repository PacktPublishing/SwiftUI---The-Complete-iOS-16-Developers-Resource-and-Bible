
import Foundation

var fruit = "Orange"
var search = "ORANGE"

var result = fruit.compare(search, options: .caseInsensitive)
switch result {
   case .orderedSame:
      print("The values are equal")  // "The values are equal"
   case .orderedDescending:
      print("Fruit follows Search")
   case .orderedAscending:
      print("Fruit precedes Search")
}
