
import SwiftUI

struct ContentView: View {
   var body: some View {
      Text("Hello World")
         .font(.largeTitle)
         .underline()
         .fontWeight(.heavy)
         .shadow(color: Color.gray, radius: 1, x: 1, y: 1)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

