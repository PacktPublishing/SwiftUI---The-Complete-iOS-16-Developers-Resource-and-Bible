
import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack {
         Spacer()
         HStack {
            Image(systemName: "cloud")
               .font(.system(size: 80))
            VStack(alignment: .leading) {
               Text("City")
                  .foregroundColor(.gray)
               Text("New York")
                  .font(.title)
            }
            Spacer()
         }
      }.ignoresSafeArea(.container, edges: .bottom)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

