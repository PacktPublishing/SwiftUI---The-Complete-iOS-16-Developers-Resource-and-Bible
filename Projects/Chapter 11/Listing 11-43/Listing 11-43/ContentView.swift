
import SwiftUI
import Charts

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      VStack {
         Chart {
            ForEach(appData.sales) { product in
               ForEach(product.sales) { sale in
                  LineMark(x: .value("Date", sale.date, unit: .day), y: .value("Sales", sale.amount))
               }.foregroundStyle(by: .value("Products", product.name))
            }
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

