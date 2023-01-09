
import SwiftUI

struct AuthorBooksView: View {
   @FetchRequest(sortDescriptors: []) var listOfBooks: FetchedResults<Books>
   var selectedAuthor: Authors?

   var body: some View {
      List {
         ForEach(listOfBooks) { book in
            Text(book.title ?? "Undefined")
         }
      }
      .navigationBarTitle(selectedAuthor?.name ?? "Undefined")
      .onAppear {
         if selectedAuthor != nil {
            listOfBooks.nsPredicate = NSPredicate(format: "author = %@", selectedAuthor!)
            listOfBooks.sortDescriptors = [SortDescriptor(\Books.title, order: .forward)]
         }
      }
   }
}
struct AuthorBooksView_Previews: PreviewProvider {
   static var previews: some View {
      AuthorBooksView(selectedAuthor: nil)
         .environment(\.managedObjectContext, ApplicationData.preview.container.viewContext)
   }
}

