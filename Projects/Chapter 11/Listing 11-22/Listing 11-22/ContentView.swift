
import SwiftUI

struct ContentView: View {
   var body: some View {
      Image("spot1")
         .resizable()
         .scaledToFit()
         .frame(width: 150, height: 200)
         .clipShape(Circle())
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

