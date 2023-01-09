
import SwiftUI

struct InsertBookView: View {
   @EnvironmentObject var appData: ApplicationData
   @Environment(\.dismiss) var dismiss
   @State private var inputTitle: String = ""
   @State private var inputAuthor: String = ""
   @State private var inputYear: String = ""

   var body: some View {
      VStack {
         HStack {
            Text("Title:")
            TextField("Insert Title", text: $inputTitle)
               .textFieldStyle(.roundedBorder)
         }
         HStack {
            Text("Author:")
            TextField("Insert Author", text: $inputAuthor)
               .textFieldStyle(.roundedBorder)
         }
         HStack {
            Text("Year:")
            TextField("Insert Year", text: $inputYear)
               .textFieldStyle(.roundedBorder)
         }
         HStack {
            Spacer()
            Button("Save") {
               let newTitle = inputTitle.trimmingCharacters(in: .whitespaces)
               let newAuthor = inputAuthor.trimmingCharacters(in: .whitespaces)
               let newYear = Int(inputYear)
               if !newTitle.isEmpty && !newAuthor.isEmpty && newYear != nil {
                  let coverName = appData.storeCover()
                  appData.saveBook(book: Book(title: newTitle, author: newAuthor, year: newYear!, cover: coverName))
                  dismiss()
               }
            }
         }
         Spacer()
      }.padding()
   }
}
struct InsertBookView_Previews: PreviewProvider {
   static var previews: some View {
      InsertBookView().environmentObject(ApplicationData())
   }
}

