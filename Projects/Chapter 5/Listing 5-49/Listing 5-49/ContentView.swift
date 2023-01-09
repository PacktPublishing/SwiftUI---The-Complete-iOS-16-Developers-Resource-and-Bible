
import SwiftUI

struct ContentView: View {
   var body: some View {
      Image(systemName: "envelope")
         .font(Font.system(size: 100).weight(.semibold))
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

