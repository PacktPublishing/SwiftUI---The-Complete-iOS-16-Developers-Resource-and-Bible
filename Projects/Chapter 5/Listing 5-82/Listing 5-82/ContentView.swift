
import SwiftUI

struct ContentView: View {
   var body: some View {
      Grid {
         GridRow {
            Image(systemName: "message")
               .frame(width: 100, height: 100)
            Image(systemName: "mic")
               .frame(width: 100, height: 100)
         }.background(.red)
         GridRow {
            Image(systemName: "phone")
               .frame(width: 100, height: 100)
            Image(systemName: "envelope")
               .frame(width: 100, height: 100)
         }.background(.blue)
      }.font(.largeTitle)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

