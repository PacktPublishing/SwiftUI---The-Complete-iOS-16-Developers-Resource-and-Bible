
import SwiftUI

struct ContentView: View {
   var body: some View {
      Canvas { context, size in
         context.addFilter(.colorMultiply(Color.red))
         context.addFilter(.blur(radius: 5))
         
         let margin = (size.width - 161) / 2
         let imageFrame = CGRect(x: margin, y: margin, width: 161, height: 216)
         context.draw(Image("spot1"), in: imageFrame)
      }.ignoresSafeArea()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

