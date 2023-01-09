
import SwiftUI

struct ContentView: View {
   @Binding var document: TextDocument

   var body: some View {
      GroupBox("Editor") {
         TextEditor(text: $document.documentText)
            .cornerRadius(10)
      }.padding()
      .navigationBarTitleDisplayMode(.inline)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView(document: .constant(TextDocument()))
   }
}

