
import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack(spacing: 10) {
         HStack {
            Button("Cancel") {
               print("Cancel Action")
            }.buttonStyle(.bordered)
            Spacer()
            Button("Send") {
               print("Send Information")
            }.buttonStyle(.borderedProminent)
         }
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

