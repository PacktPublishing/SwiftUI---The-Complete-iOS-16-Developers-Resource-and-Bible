
import SwiftUI

struct ContentView: View {
   var body: some View {
      HStack {
         Image(systemName: "cloud")
            .font(.system(size: 80))
         VStack(alignment: .leading) {
            Text("City")
               .foregroundColor(.gray)
            Text("New York")
               .font(.title)
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

