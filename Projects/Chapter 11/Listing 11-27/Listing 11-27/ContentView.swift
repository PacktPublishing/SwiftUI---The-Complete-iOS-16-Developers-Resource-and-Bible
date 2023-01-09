
import SwiftUI

struct ContentView: View {
   var body: some View {
      Canvas { context, size in
         let imageSize = CGSize(width: 161, height: 216)
         let posX = (size.width - imageSize.width) / 2
         let posY = posX

         let imageFrame = CGRect(x: posX, y: posY, width: imageSize.width, height: imageSize.height)
         context.draw(Image("spot1"), in: imageFrame)
      }.ignoresSafeArea()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

