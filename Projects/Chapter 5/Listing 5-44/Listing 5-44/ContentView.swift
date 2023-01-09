
import SwiftUI

struct ContentView: View {
   var body: some View {
      Image("Toronto")
         .resizable()
         .scaledToFit()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

