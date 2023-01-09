
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      VStack {
         TextField("Insert your Name", text: $appData.inputMessage)
         Spacer()
      }.padding()
      .frame(width: 500, height: 350)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

