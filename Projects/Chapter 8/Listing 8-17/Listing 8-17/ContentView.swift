
import SwiftUI

struct Tokens: Identifiable, Equatable {
   let id = UUID()
   let name: String
}
struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var searchTerm: String = ""
   @State private var searchTokens: [Tokens] = []

   var body: some View {
      NavigationStack {
         List(appData.filteredItems) { book in
            CellBook(book: book)
         }.navigationTitle(Text("Books"))
         .toolbar {
            let list = appData.userData.map { $0.author }
            let authors = Set(list).sorted()
            Menu(content: {
               ForEach(authors, id: \.self) { author in
                  Button(author) {
                     let token = Tokens(name: author)
                     searchTokens = [token]
                  }
               }
            }, label: {
               Image(systemName: "pencil.circle")
            })
         }
      }
      .searchable(text: $searchTerm, tokens: $searchTokens, token: { token in
         Text(token.name)
      })
      .onChange(of: searchTerm) { _ in performSearch() }
      .onChange(of: searchTokens) { _ in performSearch() }
   }
   func performSearch() {
      let search = searchTerm.trimmingCharacters(in: .whitespaces)
      appData.filterValues(search: search, author: searchTokens.first?.name ?? "")
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

