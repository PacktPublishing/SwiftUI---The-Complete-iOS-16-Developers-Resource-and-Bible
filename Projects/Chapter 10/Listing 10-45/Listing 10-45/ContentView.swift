
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      VStack(alignment: .leading) {
         Text(appData.bookInFile.title)
         Text(appData.bookInFile.author)
         Text(appData.bookInFile.publisher)
         Text(appData.bookInFile.date)
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

