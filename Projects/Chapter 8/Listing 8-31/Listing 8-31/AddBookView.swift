
import SwiftUI

struct AddBookView: View {
   @EnvironmentObject var appData: ApplicationData
   @Environment(\.dismiss) var dismiss
   @State private var titleInput: String = ""
   @State private var authorInput: String = ""
   @State private var yearInput: String = ""

   var body: some View {
      VStack(alignment: .trailing, spacing: 10) {
         HStack {
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
   }
   func storeBook() {
      let title = titleInput.trimmingCharacters(in: .whitespaces)
      let author = authorInput.trimmingCharacters(in: .whitespaces)
      if let year = Int(yearInput), !title.isEmpty && !author.isEmpty {
         let newBook = BookViewModel(book: Book(title: title, author: author, cover: "nocover", year: year, selected: false))
         appData.userData.append(newBook)
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
