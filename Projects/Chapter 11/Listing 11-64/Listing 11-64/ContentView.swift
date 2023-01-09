
import SwiftUI

struct ContentView: View {
   @State private var showInfo = false

   var body: some View {
      VStack {
         Button("Show Information") {
            showInfo.toggle()
         }.padding()
         HStack {
            if !showInfo {
               Text("Left")
                  .transition(.scale.animation(.default))
            }
            Spacer()
            if showInfo {
               Text("Right")
                  .transition(.scale.animation(.default))
            }
         }.padding()
         Spacer()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

