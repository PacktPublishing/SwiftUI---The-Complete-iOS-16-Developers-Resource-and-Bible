
import SwiftUI
import CloudKit

struct InsertCountryView: View {
   @EnvironmentObject var appData: ApplicationData
   @Environment(\.dismiss) var dismiss

   @State private var inputName: String = ""
   @State private var buttonDisabled: Bool = false

   var body: some View {
      VStack {
         HStack {
            Text("Country:")
            TextField("Insert Country", text: $inputName)
               .textFieldStyle(.roundedBorder)
         }
         HStack {
            Spacer()
            Button("Save") {
               let text = inputName.trimmingCharacters(in: .whitespaces)
               if !text.isEmpty {
                  buttonDisabled = true

                  Task(priority: .high) {
                     await appData.insertCountry(name: text)
                     dismiss()
                  }
               }
            }.disabled(buttonDisabled)
         }
         Spacer()
      }.padding()
   }
}
struct InsertCountryView_Previews: PreviewProvider {
   static var previews: some View {
      InsertCountryView().environmentObject(ApplicationData.shared)
   }
}

