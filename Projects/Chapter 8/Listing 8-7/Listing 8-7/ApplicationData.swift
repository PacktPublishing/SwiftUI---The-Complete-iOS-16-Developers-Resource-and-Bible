
import SwiftUI

struct Book: Hashable {
   var title: String
   var author: String
   var cover: String
   var year: Int
   var selected: Bool
}
struct BookViewModel: Identifiable, Hashable {
   let id = UUID()
   var book: Book

   var title: String {
      return book.title.capitalized
   }
   var author: String {
      return book.author.capitalized
   }
   var cover: String {
      return book.cover
   }
   var year: String {
      return String(book.year)
   }
   var selected: Bool {
      get {
         return book.selected
      }
      set {
         book.selected = newValue
      }
   }
}
class ApplicationData: ObservableObject {
   @Published var userData: [BookViewModel]
 
   init() {
      userData = [
         BookViewModel(book: Book(title: "Steve Jobs", author: "Walter Isaacson", cover: "book1", year: 2011, selected: false)),
         BookViewModel(book: Book(title: "HTML5 for Masterminds", author: "J.D Gauchat", cover: "book2", year: 2017, selected: false)),
         BookViewModel(book: Book(title: "The Road Ahead", author: "Bill Gates", cover: "book3", year: 1995, selected: false)),
         BookViewModel(book: Book(title: "The C Programming Language", author: "Brian W. Kernighan", cover: "book4", year: 1988, selected: false)),
         BookViewModel(book: Book(title: "Being Digital", author: "Nicholas Negroponte", cover: "book5", year: 1996, selected: false)),
         BookViewModel(book: Book(title: "Only the Paranoid Survive", author: "Andrew S. Grove", cover: "book6", year: 1999, selected: false)),
         BookViewModel(book: Book(title: "Accidental Empires", author: "Robert X. Cringely", cover: "book7", year: 1996, selected: false)),
         BookViewModel(book: Book(title: "Bobby Fischer Teaches Chess", author: "Bobby Fischer", cover: "book8", year: 1982, selected: false)),
         BookViewModel(book: Book(title: "New Guide to Science", author: "Isaac Asimov", cover: "book9", year: 1993, selected: false)),
         BookViewModel(book: Book(title: "Christine", author: "Stephen King", cover: "book10", year: 1983, selected: false)),
         BookViewModel(book: Book(title: "IT", author: "Stephen King", cover: "book11", year: 1987, selected: false)),
         BookViewModel(book: Book(title: "Ending Aging", author: "Aubrey de Grey", cover: "book12", year: 2007, selected: false))
      ]
   }
}

