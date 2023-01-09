
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      VStack {
         ForEach(appData.userData) { book in
            VStack {
               HStack(alignment: .top) {
                  Image(book.cover)
                     .resizable()
                     .scaledToFit()
                     .frame(width: 80, height: 100)
                  VStack(alignment: .leading, spacing: 2) {
                     Text(book.title).bold()
                     Text(book.author)
                     Text(book.year).font(.caption)
                  }.padding(.top, 5)
                  Spacer()
               }
               Divider()
            }
         }
         Spacer()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

