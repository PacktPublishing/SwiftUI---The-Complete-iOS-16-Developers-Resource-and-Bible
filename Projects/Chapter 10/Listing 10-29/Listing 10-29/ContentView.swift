
import SwiftUI

struct ContentView: View {
   @State private var document = TextDocument()
   @State private var openExport: Bool = false

   var body: some View {
      NavigationStack {
         GroupBox("Editor") {
            TextEditor(text: $document.documentText)
               .cornerRadius(10)
         }.padding()
         .navigationTitle("Document")
         .navigationBarTitleDisplayMode(.inline)
         .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
               Button(action: {
                  openExport = true
               }, label: {
                  Image(systemName: "square.and.arrow.up")
               })
            }
         }
      }
      .fileExporter(isPresented: $openExport, document: document, contentType: .plainText, defaultFilename: "My Message", onCompletion: { result in
         print("Document exported")
      })
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
