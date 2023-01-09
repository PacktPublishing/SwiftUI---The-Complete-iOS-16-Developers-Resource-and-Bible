
import SwiftUI

struct ContentView: View {
   let number: Float = 30.87512

   var body: some View {
      Text("My Number: \(number.formatted(.currency(code: "USD")))")
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

