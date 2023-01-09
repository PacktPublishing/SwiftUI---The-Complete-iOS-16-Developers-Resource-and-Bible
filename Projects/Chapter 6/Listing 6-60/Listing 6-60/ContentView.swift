
import SwiftUI

struct ContentView: View {
   var body: some View {
      GeometryReader { geometry in
         let isPortrait = geometry.size.height > geometry.size.width
         let message = isPortrait ? "Portrait" : "Landscape"

         HStack {
            Text(message)
         }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
      }.ignoresSafeArea()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

