
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   let guides = [
      GridItem(.flexible(minimum: 75), alignment: .top),
      GridItem(.flexible(minimum: 75), alignment: .top),
      GridItem(.flexible(minimum: 75), alignment: .top)
   ]
   var body: some View {
      ScrollView {
         LazyVGrid(columns: guides) {
            ForEach(appData.userData) { book in
               Image(book.cover)
                  .resizable()
                  .scaledToFit()
            }
         }
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

