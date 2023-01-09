
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      TabView {
         ForEach(appData.userData) { book in
            Image(book.cover)
               .resizable()
               .scaledToFit()
         }
      }.tabViewStyle(.page)
      .indexViewStyle(.page(backgroundDisplayMode: .always))
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

