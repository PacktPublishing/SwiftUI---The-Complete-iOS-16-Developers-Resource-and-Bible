
import SwiftUI
import CoreData

struct InsertBookView: View {
   @Environment(\.managedObjectContext) var dbContext
   @Environment(\.dismiss) var dismiss

   @State private var selectedAuthor: Authors? = nil
   @State private var inputTitle: String = ""
   @State private var inputYear: String = ""

   var body: some View {
      VStack(spacing: 12) {
         HStack {
            Text("Title:")
            TextField("Insert Title", text: $inputTitle)
               .textFieldStyle(.roundedBorder)
         }
         HStack {
            Text("Year:")
            TextField("Insert Year", text: $inputYear)
               .textFieldStyle(.roundedBorder)
         }
         HStack(alignment: .top) {
            Text("Author:")
            VStack(alignment: .leading, spacing: 8) {
               Text(selectedAuthor?.name ?? "Undefined")
                  .foregroundColor(selectedAuthor != nil ? Color.black : Color.gray)
               NavigationLink(destination: AuthorsView(selected: $selectedAuthor), label: {
                  Text("Select Author")
               })
            }
         }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
         Spacer()
      }.padding()
      .navigationBarTitle("Add Book")
      .toolbar {
         ToolbarItem(placement: .navigationBarTrailing) {
            Button("Save") {
               let newTitle = inputTitle.trimmingCharacters(in: .whitespaces)
               let newYear = Int32(inputYear)
               if !newTitle.isEmpty && newYear != nil {
                  Task(priority: .high) {
                     await storeBook(title: newTitle, year: newYear!)
                  }
               }
            }
         }
      }
   }
   func storeBook(title: String, year: Int32) async {
      await dbContext.perform {
         let newBook = Books(context: dbContext)
         newBook.title = title
         newBook.year = year
         newBook.author = selectedAuthor
         newBook.cover = UIImage(named: "bookcover")?.pngData()
         newBook.thumbnail = UIImage(named: "bookthumbnail")?.pngData()
         do {
            try dbContext.save()
            dismiss()
         } catch {
            print("Error saving record")
         }
      }
   }
}
struct InsertBookView_Previews: PreviewProvider {
   static var previews: some View {
      InsertBookView()
         .environment(\.managedObjectContext, ApplicationData.preview.container.viewContext)
   }
}

