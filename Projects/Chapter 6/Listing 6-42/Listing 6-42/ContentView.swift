
import SwiftUI

struct ContentView: View {
   @State private var text: String = ""

   var body: some View {
      TextField("Insert Text", text: $text, axis: .vertical)
         .textFieldStyle(.roundedBorder)
         .padding(20)
         .lineLimit(5)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

