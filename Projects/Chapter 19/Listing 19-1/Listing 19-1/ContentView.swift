
import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack {
         #if os(macOS)
            Text("Mac Application")
         #else
            Text("Mobile Application")
         #endif
      }.frame(width: 500, height: 350)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

