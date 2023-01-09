
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      VStack {
         Text(appData.textInFile)
            .lineLimit(nil)
            .padding(15)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(white: 0.8))
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

