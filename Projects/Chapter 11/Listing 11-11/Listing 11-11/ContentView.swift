
import SwiftUI

struct ContentView: View {
   var body: some View {
      RoundedRectangle(cornerRadius: 25)
         .foregroundStyle(.shadow(.drop(color: .black, radius: 3, x: 4, y: 4)))
         .foregroundColor(.red)
         .frame(width: 100, height: 100)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

