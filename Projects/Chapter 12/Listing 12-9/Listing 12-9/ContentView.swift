
import SwiftUI

struct ContentView: View {
   @GestureState private var magnification: CGFloat = 1
   @State private var zoom: CGFloat = 1

   var body: some View {
      Image("spot1")
         .resizable()
         .scaledToFit()
         .frame(width: 160, height: 200)
         .scaleEffect(zoom * magnification)

         .gesture(MagnificationGesture()
            .updating($magnification) { value, state, transaction in
               state = value
            }
            .onEnded { value in
               zoom = zoom * value
            }
         )
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

