
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   let colors = [.white, Color(white: 0.95)]

   var body: some View {
      List(appData.userData) { book in
         let index = appData.userData.firstIndex(where: { $0.id == book.id }) ?? 0

         CellBook(book: book)
            .listRowBackground(index % 2 == 0 ? colors[0] : colors[1])
            .listRowSeparator(.hidden)
      }.listStyle(.plain)
   }
}
struct CellBook: View {
   let book: BookViewModel

   var body: some View {
      HStack(alignment: .top) {
         Image(book.cover)
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 100)
         VStack(alignment: .leading, spacing: 2) {
            Text(book.title).bold()
            Text(book.author)
            Text(book.year).font(.caption)
            Spacer()
         }.padding(.top, 5)
         Spacer()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

