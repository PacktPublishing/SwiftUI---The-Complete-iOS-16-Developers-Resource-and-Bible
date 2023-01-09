
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var orderList: [(key: String, value: [BookViewModel])] {
      let listGroup: [String: [BookViewModel]] = Dictionary(grouping: appData.userData, by: { value in
         let index = value.title.startIndex
         let initial = value.title[index]
         return String(initial)
      })
      return listGroup.sorted(by: { $0.key < $1.key })
   }
   var body: some View {
      List {
         ForEach(orderList, id: \.key) { sections in
            Section(header: Text(sections.key)) {
               ForEach(sections.value) { book in
                  CellBook(book: book)
               }
            }.headerProminence(.increased)
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

