
import SwiftUI
import CoreData

struct ModifyBookView: View {
   @Environment(\.managedObjectContext) var dbContext
   @Environment(\.dismiss) var dismiss
   @State private var selectedAuthor: Authors? = nil
   @State private var inputTitle: String = ""
   @State private var inputYear: String = ""
   @State private var valuesLoaded: Bool = false

   let book: Books?

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
      .navigationBarTitle("Modify Book")
      .toolbar {
         ToolbarItem(placement: .navigationBarTrailing) {
            Button("Save") {
               let newTitle = inputTitle.trimmingCharacters(in: .whitespaces)
               let newYear = Int32(inputYear)
               if !newTitle.isEmpty && newYear != nil {
                  Task(priority: .high) {
                     await saveBook(title: newTitle, year: newYear!)
                  }
               }
            }
         }
      }
      .onAppear {
         if !valuesLoaded {
            selectedAuthor = book?.author
            inputTitle = book?.title ?? ""
            inputYear = book?.showYear ?? ""
            valuesLoaded = true
         }
      }
   }
   func saveBook(title: String, year: Int32) async {
      await dbContext.perform {
         book?.title = title
         book?.year = year
         book?.author = selectedAuthor
         do {
            try dbContext.save()
            dismiss()
         } catch {
            print("Error saving record")
         }
      }
   }
}
struct ModifyBookView_Previews: PreviewProvider {
   static var previews: some View {
      ModifyBookView(book: nil)
         .environment(\.managedObjectContext, ApplicationData.preview.container.viewContext)
   }
}

