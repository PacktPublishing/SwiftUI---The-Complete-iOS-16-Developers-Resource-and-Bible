
import SwiftUI

struct ContentView: View {
   var body: some View {
      Canvas { context, size in
         let imageFrame = CGRect(origin: .zero, size: size)
         context.draw(Image("spot1"), in: imageFrame)
      }.ignoresSafeArea()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

