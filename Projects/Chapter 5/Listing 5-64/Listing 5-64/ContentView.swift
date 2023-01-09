
import SwiftUI

struct ContentView: View {
   var body: some View {
      ZStack {
         Image(systemName: "cloud")
            .font(.system(size: 80))
         Text("New York")
            .padding(8)
            .background(Color.yellow)
            .zIndex(-1)
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

