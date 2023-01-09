
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
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

