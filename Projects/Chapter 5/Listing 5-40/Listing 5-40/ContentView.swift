
import SwiftUI

struct ContentView: View {
   var body: some View {
      Image("Toronto")
         .resizable()
         .frame(width: 250, height: 100)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

