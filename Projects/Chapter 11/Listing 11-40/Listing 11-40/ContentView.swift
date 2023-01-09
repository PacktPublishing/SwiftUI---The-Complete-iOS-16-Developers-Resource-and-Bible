
import SwiftUI
import Charts

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      VStack {
         Chart {
            ForEach(appData.listOfItems) { item in
               BarMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
                  .foregroundStyle(.cyan)
            }
            RuleMark(y: .value("Average", averageCalories()))
               .foregroundStyle(.black)
               .lineStyle(StrokeStyle(lineWidth: 5))
               .annotation(position: .bottom, alignment: .leading) {
                  Text("Average Calories")
               }
         }.frame(height: 300)
         .padding()
         Spacer()
      }
   }
   func averageCalories() -> Int {
      let total = appData.listOfItems.reduce(0, { $0 + $1.calories })
      return total / appData.listOfItems.count
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

