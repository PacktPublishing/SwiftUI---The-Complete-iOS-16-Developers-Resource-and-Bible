
import SwiftUI

struct ContentView: View {
   @Environment(\.colorScheme) var mode

   var body: some View {
      Image(systemName: "trash")
         .font(Font.system(size: 100))
         .foregroundColor(mode == .dark ? Color.yellow : Color.blue)
         .symbolVariant(mode == .dark ? .fill : .circle)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

