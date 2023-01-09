
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var selectedRows: Set<BookViewModel.ID> = []

   var body: some View {
      VStack {
         HStack {
            EditButton()
            Spacer()
            Button(action: {
               removeSelected()
            }, label: {
               Image(systemName: "trash")
            }).disabled(selectedRows.count == 0 ? true : false)
         }.padding()

         List(selection: $selectedRows) {
            ForEach(appData.userData) { book in
               CellBook(book: book)
            }
         }.listStyle(.plain)
      }
   }
   func removeSelected() {
      var indexes = IndexSet()
      for item in selectedRows {
         if let index = appData.userData.firstIndex(where: { $0.id == item }) {
            indexes.insert(index)
         }
      }
      appData.userData.remove(atOffsets: indexes)
      selectedRows = []
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

