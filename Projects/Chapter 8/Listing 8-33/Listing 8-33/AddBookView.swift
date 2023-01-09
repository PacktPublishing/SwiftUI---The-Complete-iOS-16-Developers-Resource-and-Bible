
import SwiftUI

struct AddBookView: View {
   @EnvironmentObject var appData: ApplicationData
   @Environment(\.dismiss) var dismiss
   @State private var titleInput: String = ""
   @State private var authorInput: String = ""
   @State private var yearInput: String = ""
   var book: BookViewModel?

   var body: some View {
      VStack(alignment: .trailing, spacing: 10) {
         HStack {
            Text(book == nil ? "Add Book" : "Edit Book")
               .font(.body.weight(.bold))
            Spacer()
            Button("Close") {
               dismiss()
            }.padding([.top, .bottom], 10)
         }
         TextField("Insert Title", text: $titleInput)
            .textFieldStyle(.roundedBorder)
         TextField("Insert Author", text: $authorInput)
            .textFieldStyle(.roundedBorder)
         TextField("Insert Year", text: $yearInput)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numbersAndPunctuation)
         Button("Save") {
            storeBook()
            dismiss()
         }.buttonStyle(.borderedProminent)
         Spacer()
      }.padding()
      .onAppear {
         titleInput = book?.title ?? ""
         authorInput = book?.author ?? ""
         yearInput = book?.year ?? ""
      }
   }
   func storeBook() {
      let title = titleInput.trimmingCharacters(in: .whitespaces)
      let author = authorInput.trimmingCharacters(in: .whitespaces)
      if let year = Int(yearInput), !title.isEmpty && !author.isEmpty {
         if let index = appData.userData.firstIndex(where: { $0.id == book?.id }) {
            let newBook = BookViewModel(book: Book(title: title, author: author, cover: appData.userData[index].cover, year: year, selected: false))
            appData.userData[index] = newBook
         } else {
            let newBook = BookViewModel(book: Book(title: title, author: author, cover: "nocover", year: year, selected: false))
            appData.userData.append(newBook)
         }
      }
   }
}
struct AddBookView_Previews: PreviewProvider {
   static var previews: some View {
      NavigationStack {
         AddBookView().environmentObject(ApplicationData())
      }
   }
}
