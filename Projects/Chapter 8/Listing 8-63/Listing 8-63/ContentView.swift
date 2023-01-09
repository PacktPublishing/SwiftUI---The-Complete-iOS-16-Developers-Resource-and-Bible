
import SwiftUI

struct ContentView: View {
   @State private var selectedAuthor: String?
   @State private var selectedBook: BookViewModel?
   @State private var visibility: NavigationSplitViewVisibility = .automatic

   var body: some View {
      NavigationSplitView(columnVisibility: $visibility, sidebar: {
         AuthorsView(selectedAuthor: $selectedAuthor)
      }, content: {
         BooksView(selectedBook: $selectedBook, selectedAuthor: selectedAuthor)
      }, detail: {
         if let book = selectedBook {
            DetailView(book: book)
         } else {
            PlaceholderView()
         }
      })
      .onChange(of: selectedBook) { _ in
         visibility = .detailOnly
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

