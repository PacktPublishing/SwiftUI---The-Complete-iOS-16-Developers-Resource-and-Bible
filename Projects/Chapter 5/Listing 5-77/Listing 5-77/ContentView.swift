
import SwiftUI

struct ContentView: View {
   var body: some View {
      HStack(alignment: .center) {
         Image("signbus")
            .alignmentGuide(VerticalAlignment.center) { dimension in
               dimension[VerticalAlignment.center] + 18 }
         Image("signplane")
            .alignmentGuide(VerticalAlignment.center) { dimension in
               dimension[VerticalAlignment.center] + 68 }
         Image("signphone")
            .alignmentGuide(VerticalAlignment.center) { dimension in
               dimension[VerticalAlignment.center] + 89 }
      }.border(Color.blue, width: 2)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

