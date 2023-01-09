
import SwiftUI

struct ContentView: View {
   var body: some View {
      getView()
   }
   @ViewBuilder
   func getView() -> some View {
      let valid = false

      if valid {
         Image(systemName: "keyboard")
      } else {
         Text("The state is invalid")
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

