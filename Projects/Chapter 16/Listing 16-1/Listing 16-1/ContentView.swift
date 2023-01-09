
import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack {
         MyCustomView()
            .frame(width: 200, height: 150)
            .padding()
         Spacer()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

