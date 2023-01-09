
import SwiftUI

struct ContentView: View {
   var body: some View {
      Image("Toronto")
         .resizable()
         .scaledToFit()
         .padding()
         .scaleEffect(CGSize(width: 0.5, height: 0.5))
         .blur(radius: 5)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

