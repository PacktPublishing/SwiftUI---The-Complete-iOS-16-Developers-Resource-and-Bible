
import SwiftUI

struct ContentView: View {
   @State private var currentState: Bool = true

   var body: some View {
      HStack {
         Toggle("", isOn: $currentState)
            .labelsHidden()
         Text(currentState ? "On" : "Off")
            .padding()
            .background(Color(currentState ? .yellow : .gray))
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

