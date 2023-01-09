
import SwiftUI

struct Book {
   var title: String
   var author: String
}
struct BookViewModel {
   var book: Book
   var header: String {
      return book.title + " " + book.author
   }
}
class ApplicationData: ObservableObject {
   @Published var userData: BookViewModel
    
   init() {
      userData = BookViewModel(book: Book(title: "Default Title", author: "Unknown"))
   }
}

