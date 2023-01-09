
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var searchTerm: String = ""

   var body: some View {
      NavigationStack {
         SearchableView()
            .navigationTitle(Text("Books"))
      }
      .searchable(text: $searchTerm, prompt: Text("Insert title"))
      .onChange(of: searchTerm) { value in
         let search = value.trimmingCharacters(in: .whitespaces)
         appData.filterValues(search: search)
      }
   }
}
struct SearchableView: View {
   @EnvironmentObject var appData: ApplicationData
   @Environment(\.isSearching) var isSearching
   @Environment(\.dismissSearch) var dismissSearch

   var body: some View {
      List {
         if isSearching {
            Button("Dismiss") {
               dismissSearch()
            }
         }
         ForEach(appData.filteredItems) { book in
            CellBook(book: book)
         }
      }
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

