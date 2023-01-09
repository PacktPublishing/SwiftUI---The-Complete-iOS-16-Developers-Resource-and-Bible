
import SwiftUI

struct ShowImage: View {
   var body: some View {
      Image("spot1")
         .resizable()
         .scaledToFill()
         .edgesIgnoringSafeArea(.all)
   }
}
struct ShowImage_Previews: PreviewProvider {
   static var previews: some View {
      ShowImage()
   }
}

