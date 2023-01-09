
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      Table(appData.listOfItems) {
         TableColumn("Name", value: \.name)
         TableColumn("Category", value: \.category)
         TableColumn("Calories") { item in
            Text("\(item.calories)")
         }.width(100)
         TableColumn("Included") { item in
            Toggle("", isOn: itemBinding(id: item.id).included)
                .labelsHidden()
         }.width(100)
      }
   }
   func itemBinding(id: UUID) -> Binding<ConsumableItem> {
      let index = appData.listOfItems.firstIndex(where: { $0.id == id }) ?? 0
      return $appData.listOfItems[index]
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

