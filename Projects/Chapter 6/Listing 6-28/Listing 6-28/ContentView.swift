
import SwiftUI

struct ContentView: View {
   @State private var color = Color.clear
   @State private var buttonDisabled = false

   var body: some View {
      VStack(spacing: 10) {
         Text("Default Title")
            .padding()
            .background(color)
         Button("Change Color") {
            color = Color.green
            buttonDisabled = true
         }
        .disabled(buttonDisabled)
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

