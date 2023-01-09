
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var selectedRow: BookViewModel.ID? = nil

   var body: some View {
      VStack {
         HStack {
            Spacer()
            Button(action: {
               removeSelected()
            }, label: {
               Image(systemName: "trash")
            }).disabled(selectedRow == nil ? true : false)
         }.padding()

         List(selection: $selectedRow) {
            ForEach(appData.userData) { book in
               CellBook(book: book)
            }
         }.listStyle(.plain)
      }
   }
   func removeSelected() {
      if let index = appData.userData.firstIndex(where: { $0.id == selectedRow }) {
         appData.userData.remove(at: index)
         selectedRow = nil
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

