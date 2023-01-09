
import SwiftUI

struct ContentView: View {
   @State private var selectedBook: BookViewModel?
   @State private var path = NavigationPath()
   @State private var visibility: NavigationSplitViewVisibility = .automatic

   var body: some View {
      NavigationSplitView(columnVisibility: $visibility, sidebar: {
         BooksView(selectedBook: $selectedBook)
      }, detail: {
         NavigationStack(path: $path) {
            if let book = selectedBook {
               DetailView(path: $path, book: book)
            } else {
               PlaceholderView()
            }
         }
      })
      .onChange(of: selectedBook) { _ in
         path = NavigationPath()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

