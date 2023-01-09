
import SwiftUI

struct AddBook: View {
   @EnvironmentObject var appData: ApplicationData
   @Environment(\.dismiss) var dismiss
   @State private var titleInput: String = ""

   var body: some View {
      VStack {
         HStack {
            Text("Title")
            TextField("Insert title", text: $titleInput)
               .textFieldStyle(.roundedBorder)
         }
         HStack {
            Spacer()
            Button("Save") {
               let title = titleInput.trimmingCharacters(in: .whitespaces)
               if !title.isEmpty {
                  addValue(title: title)
                  dismiss()
               }
            }
         }
         Spacer()
      }.padding()
      .navigationBarTitle("Add Book")
   }
   func addValue(title: String) {
      appData.titles.append(title)

      let center = NotificationCenter.default
      let name = Notification.Name("Update Data")
      center.post(name: name, object: nil, userInfo: nil)
   }
}
struct AddBook_Previews: PreviewProvider {
   static var previews: some View {
      AddBook().environmentObject(ApplicationData())
   }
}

