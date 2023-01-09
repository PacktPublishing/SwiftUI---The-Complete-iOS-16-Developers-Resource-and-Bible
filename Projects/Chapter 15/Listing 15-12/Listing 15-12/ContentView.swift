
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var openSheet: Bool = false

   var body: some View {
      NavigationStack {
         List {
            ForEach(appData.listOfFiles) { file in
               NavigationLink(destination: EditDocumentView(selectedFile: file)) {
                  Text(file.name)
               }
            }
            .onDelete { indexes in
               Task(priority: .background) {
                  await appData.removeFiles(indexes: indexes)
               }
            }
         }
         .navigationBarTitle("List of Files")
         .navigationBarTitleDisplayMode(.inline)
         .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
               Button("Create File") {
                  openSheet = true
               }
            }
         }
         .sheet(isPresented: $openSheet) {
            CreateFileView()
         }
      }
   }
   struct CreateFileView: View {
      @EnvironmentObject var appData: ApplicationData
      @Environment(\.dismiss) var dismiss

      @State private var inputFileName: String = ""
      @State private var buttonDisabled: Bool = false

      var body: some View {
         VStack {
            HStack {
               Button("Close") {
                  dismiss()
               }
               Spacer()
               Button("Create") {
                  let fileName = inputFileName.trimmingCharacters(in: .whitespaces)
                  if !fileName.isEmpty && !appData.listOfFiles.contains(where: { $0.name == fileName }) {
                     buttonDisabled = true

                     Task(priority: .high) {
                        await appData.createFile(name: fileName)
                        dismiss()
                     }
                  }
               }.disabled(buttonDisabled)
            }.padding()
            TextField("Insert name and extension", text: $inputFileName)
               .textFieldStyle(.roundedBorder)
               .autocapitalization(.none)
               .disableAutocorrection(true)
               .padding()
            Spacer()
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

