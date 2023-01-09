
import SwiftUI

struct ContentView: View {
   @State private var text: String = ""

   var body: some View {
      TextEditor(text: $text)
         .multilineTextAlignment(.leading)
         .lineSpacing(10)
         .disableAutocorrection(true)
         .padding(8)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

