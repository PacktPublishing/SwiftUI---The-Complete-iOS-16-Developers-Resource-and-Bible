
import SwiftUI

struct ContentView: View {
   var body: some View {
      ZStack(alignment: .center) {
         Image(systemName: "cloud")
            .font(.system(size: 80))
         Text("New York")
            .font(.body.bold())
      }.foregroundColor(Color.red)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

