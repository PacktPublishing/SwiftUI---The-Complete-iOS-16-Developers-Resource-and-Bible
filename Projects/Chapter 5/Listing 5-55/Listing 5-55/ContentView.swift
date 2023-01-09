
import SwiftUI

struct ContentView: View {
   var body: some View {
      Label("Hello", systemImage: "envelope.circle")
         .font(.largeTitle)
         .labelStyle(.titleAndIcon)
         .imageScale(.large)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

