
import SwiftUI

struct ContentView: View {
   var body: some View {
      HStack {
         Image(systemName: "cloud")
            .font(.system(size: 80))
         Text("New York")
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

