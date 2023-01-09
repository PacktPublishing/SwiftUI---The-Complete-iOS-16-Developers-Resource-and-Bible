
import SwiftUI

struct ContentView: View {
   @State private var editDocument: Bool = false

   var body: some View {
      VStack {
         Text("My Document")
            .padding()
         Button("Open Document") {
            editDocument = true
         }.buttonStyle(.borderedProminent)
         .padding()
      }
      .sheet(isPresented: $editDocument) {
         EditDocumentView()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

