
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var title: String = ""

   var body: some View {
      VStack {
         TextField("Title", text: $title)
            .padding()
         ScrollView {
            LazyVStack {
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
                     }.padding([.leading, .trailing], 10)
                        .padding([.top, .bottom], 5)
                     Divider()
                  }
               }
            }
         }
         .scrollIndicators(.never)
         .scrollDismissesKeyboard(.immediately)
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

