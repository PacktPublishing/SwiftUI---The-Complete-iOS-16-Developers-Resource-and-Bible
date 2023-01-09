
import SwiftUI

struct ContentView: View {
   @ScaledMetric var customSize: CGFloat = 100

   var body: some View {
      Image("Toronto")
         .resizable()
         .frame(width: customSize, height: customSize)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

