
import SwiftUI

struct ContentView: View {
   var body: some View {
      HStack {
         Text("Manchester")
            .font(.title)
            .lineLimit(1)
            .fixedSize()
         Image(systemName: "cloud")
            .font(.system(size: 80))
         Text("New York")
            .font(.title)
            .lineLimit(1)
            .layoutPriority(1)
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

