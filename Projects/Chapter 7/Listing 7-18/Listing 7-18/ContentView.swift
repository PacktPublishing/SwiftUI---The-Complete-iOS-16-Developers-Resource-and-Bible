
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      List {
         Section(header: Text("Statistics")) {
            HStack {
               Text("Total Books:")
               Spacer()
               Text(String(appData.userData.count))
            }
         }.headerProminence(.increased)
         Section(header: Text("My Books")) {
            ForEach(appData.userData) { book in
               CellBook(book: book)
            }
         }.headerProminence(.increased)
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

