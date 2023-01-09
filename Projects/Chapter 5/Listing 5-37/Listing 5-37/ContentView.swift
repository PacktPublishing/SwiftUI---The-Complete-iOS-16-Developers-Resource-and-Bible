
import SwiftUI

struct ContentView: View {
   var body: some View {
      Text("Hello World")
         .font(.largeTitle)
         .background(.red)
         .foregroundStyle(.thickMaterial)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

