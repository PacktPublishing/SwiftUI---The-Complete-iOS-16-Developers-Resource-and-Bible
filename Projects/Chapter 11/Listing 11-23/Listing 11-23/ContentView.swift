
import SwiftUI

struct ContentView: View {
   var body: some View {
      RoundedRectangle(cornerRadius: 20)
         .rotation(.degrees(45))
         .fill(Color.red)
         .frame(width: 100, height: 100)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

