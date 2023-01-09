
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var showSheet: Bool = false

   var body: some View {
      NavigationStack {
         List(appData.userData) { book in
            CellBook(book: book)
         }.navigationTitle(Text("Books"))
         .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
               Button(action: {
                  showSheet = true
               }, label: { Image(systemName: "plus") })
            }
         }
         .sheet(isPresented: $showSheet) {
            AddBookView()
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

