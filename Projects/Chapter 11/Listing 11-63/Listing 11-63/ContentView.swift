
import SwiftUI

struct ContentView: View {
   @State private var showInfo = false

   var body: some View {
      VStack {
         Button("Show Information") {
            withAnimation {
               showInfo.toggle()
            }
         }.padding()
         if showInfo {
            Text("This is the information")
               .transition(.move(edge: .leading))
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

