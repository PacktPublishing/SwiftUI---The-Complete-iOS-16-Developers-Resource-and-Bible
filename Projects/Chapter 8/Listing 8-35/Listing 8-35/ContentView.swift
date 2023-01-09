
import SwiftUI

struct ContentView: View {
   @State private var showPopover: Bool = false

   var body: some View {
      VStack {
         Button("Show Popover") {
            showPopover = true
         }
         .popover(isPresented: $showPopover, arrowEdge: .top) {
            HelpView()
         }
         Spacer()
      }.font(.title)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

