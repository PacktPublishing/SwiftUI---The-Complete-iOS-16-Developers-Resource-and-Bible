
import SwiftUI
import CoreData

struct ContentView: View {
   @FetchRequest(sortDescriptors: [], predicate: nil, animation: .default) var listOfBooks: FetchedResults<Books>
   @State private var search: String = ""

   var body: some View {
      NavigationStack {
         List {
            ForEach(listOfBooks) { book in
               NavigationLink(destination: ModifyBookView(book: book), label: {
                  RowBook(book: book)
                     .id(UUID())
               })
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
         .searchable(text: $search, prompt: Text("Insert Title"))
         .onChange(of: search) { value in
            if !value.isEmpty {
               listOfBooks.nsPredicate = NSPredicate(format: "title CONTAINS[dc] %@", value)
            } else {
               listOfBooks.nsPredicate = nil
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

