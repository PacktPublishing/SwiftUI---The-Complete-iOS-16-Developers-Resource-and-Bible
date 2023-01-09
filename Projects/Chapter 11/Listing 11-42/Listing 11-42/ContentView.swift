
import SwiftUI
import Charts

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      VStack {
         Chart(appData.listOfItems) { item in
            LineMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
               .interpolationMethod(.catmullRom)
            PointMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
               .foregroundStyle(by: .value("Category", item.category))
               .symbol(by: .value("Category", item.category))
               .symbolSize(200)
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

