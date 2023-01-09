
import SwiftUI

struct BooksView: View {
   @EnvironmentObject var appData: ApplicationData
   @Binding var selectedBook: BookViewModel?

   var body: some View {
      List(appData.userData, selection: $selectedBook) { book in
         NavigationLink(value: book, label: {
            Text(book.title)
         })
      }
      .listStyle(.sidebar)
      .navigationTitle("Books")
   }
}
struct BooksView_Previews: PreviewProvider {
   static var previews: some View {
      BooksView(selectedBook: .constant(nil))
         .environmentObject(ApplicationData())
   }
}

