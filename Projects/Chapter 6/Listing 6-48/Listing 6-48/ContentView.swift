
import SwiftUI

struct ContentView: View {
   @State private var currentState: Bool = true

   var body: some View {
      HStack {
         Toggle(isOn: $currentState, label: {
            Label("Send", systemImage: "mail")
         })
         .toggleStyle(.button)
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

