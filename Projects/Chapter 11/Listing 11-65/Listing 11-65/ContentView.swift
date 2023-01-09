
import SwiftUI

struct ContentView: View {
   @Namespace private var myAnimations
   @State private var showInfo = false

   var body: some View {
      VStack {
         Button("Show Information") {
            withAnimation(.easeInOut) {
               showInfo.toggle()
            }
         }.padding()
         HStack {
            if !showInfo {
               Text("Left")
                  .matchedGeometryEffect(id: "TextAnimation", in: myAnimations)
            }
            Spacer()
            if showInfo {
               Text("Right")
                  .matchedGeometryEffect(id: "TextAnimation", in: myAnimations)
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

