
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      NavigationStack {
         List(appData.userData) { book in
            CellBook(book: book)
         }
         .navigationTitle(Text("Books"))
         .toolbar {
            Menu(content: {
               Button("Option 1") { print("Option 1") }
               Button("Option 2") { print("Option 2") }
               Button("Option 3") { print("Option 3") }
            }, label: {
               Image(systemName: "filemenu.and.selection")
            })
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

