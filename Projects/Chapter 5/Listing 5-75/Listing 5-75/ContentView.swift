
import SwiftUI

struct ContentView: View {
   var body: some View {
      HStack(alignment: .center) {
         Image("signbus")
         Image("signplane")
         Image("signphone")
      }.border(Color.blue, width: 2)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

