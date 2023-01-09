
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var sort = [KeyPathComparator(\ConsumableItem.name), KeyPathComparator(\ConsumableItem.calories)]

   var sortedItems: [ConsumableItem] {
      let list = appData.listOfItems.sorted(using: sort)
      return list
   }
   var body: some View {
      Table(sortedItems, sortOrder: $sort) {
         TableColumn("Name", value: \.name)
         TableColumn("Category", value: \.category)
         TableColumn("Calories", value: \.calories) { item in
            Text("\(item.calories)")
         }.width(100)
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

