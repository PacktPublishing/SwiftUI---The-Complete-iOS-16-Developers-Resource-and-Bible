
import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack {
         ForEach(1...5, id: \.self) { value in
            Text("Value: \(value)")
         }
         Spacer()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

