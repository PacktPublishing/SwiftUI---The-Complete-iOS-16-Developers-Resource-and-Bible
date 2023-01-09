
import SwiftUI

struct ContentView: View {
   @State private var selectedBook: BookViewModel?
   @State private var visibility: NavigationSplitViewVisibility = .automatic
   
   var body: some View {
      NavigationSplitView(columnVisibility: $visibility, sidebar: {
         BooksView(selectedBook: $selectedBook)
      }, detail: {
         if let book = selectedBook {
            DetailView(book: book)
         } else {
            PlaceholderView()
         }
      })
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

