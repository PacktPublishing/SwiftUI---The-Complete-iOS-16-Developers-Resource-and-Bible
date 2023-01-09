
import SwiftUI

struct ContentView: View {
   let today = Date()

   var body: some View {
      Text(today.formatted(date: .abbreviated, time: .omitted))
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

