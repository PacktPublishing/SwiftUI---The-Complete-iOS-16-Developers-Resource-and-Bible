
import SwiftUI

struct ContentView: View {
   var body: some View {
      Text("Hello World")
         .font(.largeTitle)
         .padding(20)
         .background(Color.gray)
         .cornerRadius(20)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

