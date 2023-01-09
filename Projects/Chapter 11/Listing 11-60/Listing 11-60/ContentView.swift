
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
               .transition(.mytransition)
         }
         Spacer()
      }
   }
}
extension AnyTransition {
   static var mytransition: AnyTransition {
      let animation = Animation.easeInOut(duration: 2)
      let transition = AnyTransition.scale
         .animation(animation)
      return transition
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

