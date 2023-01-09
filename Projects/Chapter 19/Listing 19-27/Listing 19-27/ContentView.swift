
import SwiftUI

struct ContentView: View {
   @Environment(\.openWindow) var openWindow

   var body: some View {
      VStack {
         Text("Hello, world!")
         Button("Open Auxiliary Window") {
            openWindow(id: "mywindow")
         }
      }.frame(width: 500, height: 300)
    }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

