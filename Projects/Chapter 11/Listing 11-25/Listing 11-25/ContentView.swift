
import SwiftUI

struct ContentView: View {
   var body: some View {
      HStack {
         Triangle()
            .trim(from: 0, to: 0.70)
            .stroke(Color.blue, lineWidth: 10)
            .frame(width: 100, height: 100)
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

