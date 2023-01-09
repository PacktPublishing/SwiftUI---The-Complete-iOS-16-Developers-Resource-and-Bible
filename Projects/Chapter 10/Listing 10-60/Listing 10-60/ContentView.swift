
import SwiftUI
import CoreData

struct ContentView: View {
   @FetchRequest(sortDescriptors: [SortDescriptor(\Books.title, comparator: .lexical, order: .forward)], predicate: nil, animation: .default) var listOfBooks: FetchedResults<Books>

   var body: some View {
      NavigationStack {
         List {
             ForEach(listOfBooks) { book in
               RowBook(book: book)
            }
         }
         .navigationBarTitle("Books")
         .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
               NavigationLink(destination: InsertBookView(), label: {
                  Image(systemName: "plus")
               })
            }
         }
      }
   }
}
struct RowBook: View {
   let book: Books

   var body: some View {
      HStack(alignment: .top) {
         Image(uiImage: book.showThumbnail)
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 100)
            .cornerRadius(10)
         VStack(alignment: .leading, spacing: 2) {
            Text(book.showTitle)
               .bold()
            Text(book.showAuthor)
            Text(book.showYear)
               .font(.caption)
            Spacer()
         }.padding(.top, 5)
         Spacer()
      }.padding(.top, 10)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
         .environment(\.managedObjectContext, ApplicationData.preview.container.viewContext)
   }
}

