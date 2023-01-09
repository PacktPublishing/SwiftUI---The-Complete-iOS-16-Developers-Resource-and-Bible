
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   let guides = [
      GridItem(.adaptive(minimum: 75))
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

