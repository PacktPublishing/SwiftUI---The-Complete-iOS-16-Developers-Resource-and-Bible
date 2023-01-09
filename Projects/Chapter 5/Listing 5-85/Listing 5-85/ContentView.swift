
import SwiftUI

struct ContentView: View {
   var body: some View {
      Grid {
         GridRow {
            Image(systemName: "phone")
               .frame(width: 100, height: 100)
               .background(.blue)
            ExtractedView()
         }
      }.font(.title2)
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

