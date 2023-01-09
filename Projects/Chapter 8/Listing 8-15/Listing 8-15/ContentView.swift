
import SwiftUI

enum Scopes {
   case title, author
}
struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var searchTerm: String = ""
   @State private var searchScope: Scopes = .title

   var body: some View {
      NavigationStack {
         List(appData.filteredItems) { book in
            CellBook(book: book)
         }.navigationTitle(Text("Books"))
      }
      .searchable(text: $searchTerm, prompt: Text("Insert title"))
      .searchScopes($searchScope, scopes: {
         Text("Title").tag(Scopes.title)
         Text("Author").tag(Scopes.author)
      })
      .onChange(of: searchTerm) { _ in performSearch() }
      .onChange(of: searchScope) { _ in performSearch() }
   }
   func performSearch() {
      let search = searchTerm.trimmingCharacters(in: .whitespaces)
      appData.filterValues(search: search, scope: searchScope)
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

