
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var selectedItems: Set<ConsumableItem.ID> = []

   var body: some View {
      VStack {
         EditButton()
         Table(appData.listOfItems, selection: $selectedItems) {
            TableColumn("Name", value: \.name)
            TableColumn("Category", value: \.category)
            TableColumn("Calories") { item in
               Text("\(item.calories)")
            }.width(100)
         }
         Text(listSelected())
            .padding()
      }
   }
   func listSelected() -> String {
      let list: [String] = selectedItems.map({ id in
         let item = appData.listOfItems.first(where: { $0.id == id })
         return item?.name ?? ""
      })
      return String(list.sorted().joined(separator: " "))
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

