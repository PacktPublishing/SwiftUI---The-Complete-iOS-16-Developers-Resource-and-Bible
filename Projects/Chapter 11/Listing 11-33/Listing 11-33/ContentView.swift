
import SwiftUI

struct ContentView: View {
   var body: some View {
      Canvas { context, size in
         let imageFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
         context.translateBy(x: size.width/2, y: size.height/2)

         let clipFrame = CGRect(x: -100, y: -100, width: 200, height: 200)
         context.clip(to: Circle().path(in: clipFrame))

         for _ in 0..<10 {
            context.rotate(by: .degrees(36))
            context.draw(Image("spot1"), in: imageFrame)
         }
      }.ignoresSafeArea()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

