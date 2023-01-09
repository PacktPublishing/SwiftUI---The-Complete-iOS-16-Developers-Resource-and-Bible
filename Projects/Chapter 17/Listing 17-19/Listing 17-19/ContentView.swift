
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      VStack {
         Button("Load Web") {
            Task(priority: .high) {
               await appData.loadWeb()
            }
         }.disabled(appData.buttonDisabled)
            Text("Total Characters: \(appData.webContent.count)")
               .padding()
            Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

