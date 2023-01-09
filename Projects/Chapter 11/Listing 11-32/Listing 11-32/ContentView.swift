
import SwiftUI

struct ContentView: View {
   var body: some View {
      Canvas { context, size in
         let imageReady = context.resolve(Image("spot1"))
         let imageFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
         context.translateBy(x: size.width/2, y: size.height/2)
         for _ in 0..<10 {
            context.rotate(by: .degrees(36))
            context.draw(imageReady, in: imageFrame)
         }
      }.ignoresSafeArea()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

