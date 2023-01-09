
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      NavigationStack {
         ScrollViewReader { proxy in
            List(appData.userData) { book in
               CellBook(book: book)
                  .id(book.id)
            }
            .navigationTitle(Text("Books"))
            .toolbar {
               ToolbarItemGroup(placement: .navigationBarTrailing) {
                  Button(action: {
                     if let lastIndex = appData.userData.first?.id {
                        proxy.scrollTo(lastIndex, anchor: .bottom)
                     }
                  }, label: { Image(systemName: "arrow.up.doc") })
                  Button(action: {
                     if let lastIndex = appData.userData.last?.id {
                        proxy.scrollTo(lastIndex, anchor: .bottom)
                     }
                  }, label: { Image(systemName: "arrow.down.doc") })
               }
            }
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

