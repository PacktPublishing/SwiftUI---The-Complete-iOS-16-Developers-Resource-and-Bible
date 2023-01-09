
import SwiftUI
import Charts

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      VStack {
         Chart(appData.listOfItems) { item in
            BarMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
               .foregroundStyle(by: .value("Category", item.category))
         }.frame(height: 300)
         .padding()
         Spacer()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

