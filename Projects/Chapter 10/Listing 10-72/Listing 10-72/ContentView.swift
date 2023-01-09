
import SwiftUI
import CoreData

struct ContentView: View {
   @Environment(\.managedObjectContext) var dbContext
   @FetchRequest(sortDescriptors: [SortDescriptor(\Books.title, order: .forward)], predicate: nil, animation: .default) var listOfBooks: FetchedResults<Books>
   @State private var totalBooks: Int = 0

   var body: some View {
      NavigationStack {
         List {
            HStack {
               Text("Total Books")
               Spacer()
               Text("\(totalBooks)")
                  .bold()
            }.foregroundColor(Color.green)

            ForEach(listOfBooks) { book in
               NavigationLink(destination: ModifyBookView(book: book), label: {
                  RowBook(book: book)
                     .id(UUID())
               })
            }
            .onDelete(perform: { indexes in
               for index in indexes {
                  dbContext.delete(listOfBooks[index])
                  countBooks()
               }
               do {
                  try dbContext.save()
               } catch {
                  print("Error deleting objects")
               }
            })
         }
         .navigationBarTitle("Books")
         .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
               NavigationLink(destination: InsertBookView(), label: {
                  Image(systemName: "plus")
               })
            }
         }
         .onAppear {
            countBooks()
         }
      }
   }
   func countBooks() {
      let request: NSFetchRequest<Books> = Books.fetchRequest()
      if let list = try? self.dbContext.fetch(request) {
         totalBooks = list.count
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

