
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      List {
         ForEach(appData.userData) { book in
            CellBook(book: book)
               .swipeActions {
                  Button(role: .destructive, action: {
                     removeBook(book: book)
                  }, label: {
                     Image(systemName: "trash")
                  })
               }
         }
      }.listStyle(.plain)
   }
   func removeBook(book: BookViewModel) {
      var indexes = IndexSet()
      if let index = appData.userData.firstIndex(where: { $0.id == book.id }) {
         indexes.insert(index)
      }
      appData.userData.remove(atOffsets: indexes)
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

