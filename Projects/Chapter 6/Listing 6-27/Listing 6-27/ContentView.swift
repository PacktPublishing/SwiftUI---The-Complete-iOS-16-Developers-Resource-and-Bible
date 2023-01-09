
import SwiftUI

struct ContentView: View {
   @State private var showInfo = false

   var body: some View {
      VStack(spacing: 10) {
         Button("Show Information") {
            showInfo.toggle()
         }.padding()
         if showInfo {
            Text("This is the information")
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

