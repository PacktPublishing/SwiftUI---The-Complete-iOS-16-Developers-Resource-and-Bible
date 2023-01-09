
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var path = NavigationPath()

   var body: some View {
      NavigationStack(path: $path) {
         List(appData.userData) { book in
            NavigationLink(value: book, label: {
               CellBook(book: book)
            })
         }.navigationTitle(Text("Books"))
         .navigationDestination(for: BookViewModel.self, destination: { book in
            DetailView(path: $path, book: book)
         })
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

