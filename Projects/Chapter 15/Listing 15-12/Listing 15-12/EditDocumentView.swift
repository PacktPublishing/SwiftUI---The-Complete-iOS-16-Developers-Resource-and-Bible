
import SwiftUI

struct EditDocumentView: View {
   @EnvironmentObject var appData: ApplicationData
   @Environment(\.dismiss) var dismiss
   @State private var inputText: String = ""

   let selectedFile: FileInfo

   var body: some View {
      GroupBox {
         TextEditor(text: $inputText)
      }
      .navigationBarTitle(selectedFile.name)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
         ToolbarItem(placement: .navigationBarTrailing) {
            Button("Save") {
               Task(priority: .high) {
                  await appData.saveDocument(url: selectedFile.url, content: inputText)
                  dismiss()
               }
            }
         }
      }
      .task {
         inputText = await appData.openDocument(url: selectedFile.url)
      }
      .onDisappear {
         Task(priority: .background) {
            await appData.closeDocument()
         }
      }
   }
}
struct EditDocumentView_Previews: PreviewProvider {
   static var previews: some View {
      NavigationStack {
         EditDocumentView(selectedFile: FileInfo(name: "", url: URL(fileURLWithPath: "")))
            .environmentObject(ApplicationData())
      }
   }
}

