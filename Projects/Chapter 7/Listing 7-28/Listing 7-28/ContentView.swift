
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var selectedRow: BookViewModel.ID? = nil

   var body: some View {
      List {
         ForEach(appData.userData) { book in
            CellBook(selected: $selectedRow, book: book)
               .background(.white)
               .onTapGesture {
                  if selectedRow == book.id {
                     selectedRow = nil
                  } else {
                     selectedRow = book.id
                  }
               }
         }
      }.listStyle(.plain)
   }
}
struct CellBook: View {
   @Binding var selected: BookViewModel.ID?
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
         if selected == book.id {
            Image(systemName: "checkmark")
               .foregroundColor(Color.green)
               .frame(width: 25, height: 25)
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

