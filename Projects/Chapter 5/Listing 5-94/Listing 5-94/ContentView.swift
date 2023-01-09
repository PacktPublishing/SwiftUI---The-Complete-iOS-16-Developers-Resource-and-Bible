
import SwiftUI

struct ContentView: View {
   var body: some View {
      Text("Hello World")
         .foregroundColor(Color("MyColor"))
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
         .environment(\.colorScheme, .dark)
   }
}

