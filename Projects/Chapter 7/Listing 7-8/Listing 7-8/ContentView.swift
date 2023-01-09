
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
         LazyHStack(spacing: 0) {
            ForEach(appData.userData) { book in
               CellView(book: book)
            }
         }
      }
   }
}
struct CellView: View {
   let book: BookViewModel

   var body: some View {
      VStack {
         Image(book.cover)
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 100)
         Text(book.title)
            .font(.caption)
      }.padding(10)
         .frame(width: 100, height: 150)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

