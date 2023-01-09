
import SwiftUI

struct ContentView: View {
   let valid = true

   var body: some View {
      Group {
         if valid {
            Image(systemName: "keyboard")
         } else {
            Text("The state is invalid")
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

