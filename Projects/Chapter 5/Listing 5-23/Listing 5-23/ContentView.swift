
import SwiftUI

struct ContentView: View {
   var body: some View {
      Text("Monsters are real, and ghosts are real too. They live inside us, and sometimes, they win. Stephen King.")
         .padding()
         .multilineTextAlignment(.center)
         .lineSpacing(5)
         .textSelection(.enabled)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

