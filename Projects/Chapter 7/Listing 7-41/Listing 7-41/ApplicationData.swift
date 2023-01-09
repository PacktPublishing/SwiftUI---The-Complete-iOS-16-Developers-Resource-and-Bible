
import SwiftUI

struct ConsumableItem: Identifiable {
   let id = UUID()
   var name: String
   var category: String
   var calories: Int
   var included: Bool
}
class ApplicationData: ObservableObject {
   @Published var listOfItems: [ConsumableItem]
   
   init() {
      listOfItems = [
         ConsumableItem(name: "Bagels", category: "Baked", calories: 250, included: false),
         ConsumableItem(name: "Brownies", category: "Baked", calories: 466, included: false),
         ConsumableItem(name: "Butter", category: "Dairy", calories: 717, included: false),
         ConsumableItem(name: "Cheese", category: "Dairy", calories: 402, included: false),
         ConsumableItem(name: "Juice", category: "Beverages", calories: 23, included: false),
         ConsumableItem(name: "Lemonade", category: "Beverages", calories: 40, included: false)
      ]
   }
}
struct CompareBool: SortComparator {
   typealias Compared = Bool
   var order: SortOrder = .forward

   func compare(_ lhs: Bool, _ rhs: Bool) -> ComparisonResult {
      if lhs && !rhs {
         return order == .forward ? .orderedAscending : .orderedDescending
      } else if !lhs && rhs {
         return order == .forward ? .orderedDescending : .orderedAscending
      } else {
         return .orderedSame
      }
   }
}

