
import SwiftUI

struct ContentView: View {
   var body: some View {
      Rectangle()
         .fill(.image(Image("pattern")))
         .frame(width: 100, height: 100)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

