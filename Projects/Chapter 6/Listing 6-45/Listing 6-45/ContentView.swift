
import SwiftUI

struct ContentView: View {
   @State private var currentState: Bool = true

   var body: some View {
      VStack {
         Toggle(isOn: $currentState, label: {
            Text(currentState ? "On" : "Off")
         })
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

