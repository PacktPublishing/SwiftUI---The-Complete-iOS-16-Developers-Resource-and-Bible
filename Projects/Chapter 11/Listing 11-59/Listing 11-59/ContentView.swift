
import SwiftUI

struct ContentView: View {
   @State private var showInfo = false

   var body: some View {
      VStack {
         Button("Show Information") {
            showInfo.toggle()
         }.padding()
         if showInfo {
            Text("This is the information")
               .transition(.scale.animation(.default))
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

