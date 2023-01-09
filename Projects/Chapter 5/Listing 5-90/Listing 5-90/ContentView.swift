
import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack {
         Text("View Title")
         getView()
      }
   }
   @ViewBuilder
   func getView() -> some View {
      let valid = false

      if valid {
         Image(systemName: "keyboard")
      } else {
         EmptyView()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

