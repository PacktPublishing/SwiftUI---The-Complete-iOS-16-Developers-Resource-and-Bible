
import SwiftUI

struct ContentView: View {
   var body: some View {
      Image("Toronto")
         .resizable()
         .scaledToFill()
         .frame(width: 250, height: 100)
         .clipped()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

