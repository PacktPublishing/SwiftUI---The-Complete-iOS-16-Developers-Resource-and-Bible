
import SwiftUI

struct AddFileView: View {
   @EnvironmentObject var appData: ApplicationData
   @Environment(\.dismiss) var dismiss
   @State private var nameInput: String = ""

   var body: some View {
      VStack {
         HStack {
            Text("Name:")
            TextField("Insert File Name", text: $nameInput)
               .textFieldStyle(.roundedBorder)
               .autocapitalization(.none)
               .disableAutocorrection(true)
         }.padding(.top, 25)
         HStack {
            Spacer()
            Button("Create") {
               var fileName = nameInput.trimmingCharacters(in: .whitespaces)
               if !fileName.isEmpty {
                  fileName += ".txt"
                  appData.saveFile(name: fileName)
                  dismiss()
               }
            }
         }
         Spacer()
      }.padding()
   }
}
struct AddFileView_Previews: PreviewProvider {
   static var previews: some View {
      AddFileView().environmentObject(ApplicationData())
   }
}

