
import SwiftUI
import CoreData

struct ContentView: View {
   @FetchRequest(sortDescriptors: [SortDescriptor(\Books.title, order: .forward)], predicate: nil, animation: .default) var listOfBooks: FetchedResults<Books>
   @Environment(\.managedObjectContext) var dbContext

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
         .onAppear {
            let request: NSFetchRequest<Authors> = Authors.fetchRequest()
            request.predicate = NSPredicate(format: "name == %@", "Stephen King")
            if let list = try? dbContext.fetch(request), list.count > 0 {
               let author = list[0]

               Task(priority: .high) {
                  await dbContext.perform {
                     for book in listOfBooks {
                        let authorSet = book.mutableSetValue(forKey: "author")
                        authorSet.remove(author)
                        book.author = authorSet
                     }
                     try? dbContext.save()
                  }
               }
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
            Text(book.showAuthors)
               .lineLimit(2)
            Text(book.showYear)
               .font(.caption)
            Spacer()
         }.padding(.top, 5)
         Spacer()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
         .environment(\.managedObjectContext, ApplicationData.preview.container.viewContext)
   }
}

