
import SwiftUI

struct ContentView: View {
   var body: some View {
      Canvas { context, size in
         let imageFrame = CGRect(x: 60, y: 75, width: 161, height: 216)
         context.draw(Image("spot1"), in: imageFrame)
         
         context.rotate(by: .degrees(20))
         context.draw(Image("spot1"), in: imageFrame)
      }.ignoresSafeArea()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

