
import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack {
         Group {
            Text("This is the list of")
            Text("Cities")
         }.foregroundColor(Color.gray)
         Group {
            Text("Manchester")
            Text("Viena")
         }.font(.largeTitle)
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

