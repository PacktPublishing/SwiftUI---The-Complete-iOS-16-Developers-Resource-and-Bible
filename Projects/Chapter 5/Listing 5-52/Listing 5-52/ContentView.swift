
import SwiftUI

struct ContentView: View {
   var body: some View {
      Image(systemName: "mic.badge.plus")
         .font(Font.system(size: 100))
         .symbolRenderingMode(.multicolor)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

