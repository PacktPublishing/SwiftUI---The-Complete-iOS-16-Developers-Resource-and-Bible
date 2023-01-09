
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var searchTerm: String = ""

   var body: some View {
      NavigationStack {
         List(appData.filteredItems) { book in
            CellBook(book: book)
         }
         .navigationTitle(Text("Books"))
      }
      .searchable(text: $searchTerm, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Insert title"))
      .onChange(of: searchTerm) { value in
         let search = value.trimmingCharacters(in: .whitespaces)
         appData.filterValues(search: search)
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

