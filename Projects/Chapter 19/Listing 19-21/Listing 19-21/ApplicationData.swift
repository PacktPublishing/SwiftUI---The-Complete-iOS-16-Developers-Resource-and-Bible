
import SwiftUI

struct ConsumableItems: Identifiable, Hashable {
   let id = UUID()
   var name: String
   var items: [String]
}
struct ConsumableSections: Identifiable, Hashable {
   let id = UUID()
   var name: String
   var sectionItems: [ConsumableItems]
}
class ApplicationData: ObservableObject {
   @Published var listOfItems: [ConsumableSections]

   init() {
      let items1 = ConsumableItems(name: "Fruits", items: ["Apples", "Avocado", "Bananas", "Blueberries", "Grapes", "Lemons", "Oranges", "Peaches"])
      let items2 = ConsumableItems(name: "Dairy", items: ["Milk", "Butter", "Cheese", "Yogurt", "Cream", "Ice Cream"])
      let items3 = ConsumableItems(name: "Juice", items: ["Apple", "Orange", "Grape"])
      
      listOfItems = [
         ConsumableSections(name: "Foods", sectionItems: [items1, items2]),
         ConsumableSections(name: "Beverages", sectionItems: [items3])
      ]
   }
}

