
import SwiftUI

struct ContentView: View {
   var body: some View {
      Canvas { context, size in
         context.translateBy(x: size.width/2, y: size.height/2)
         context.rotate(by: .degrees(45))

         let width = 161
         let height = 216
         let imageFrame = CGRect(x: -width/2, y: -height/2, width: width, height: height)
         context.draw(Image("spot1"), in: imageFrame)
      }.ignoresSafeArea()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

