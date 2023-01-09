
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      VStack {
         TextField("Insert your Name", text: $appData.inputMessage)
            .padding()
         TextField("Insert Address", text: $appData.inputAddress)
            .padding([.leading, .trailing])
            .focusedValue(\.address, appData.inputAddress)
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

