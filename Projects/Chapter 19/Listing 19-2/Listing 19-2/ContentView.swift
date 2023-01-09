
import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack {
         Text("My Application")
         #if os(macOS)
            .foregroundColor(.red)
         #else
            .foregroundColor(.green)
         #endif
      }.frame(width: 500, height: 350)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

