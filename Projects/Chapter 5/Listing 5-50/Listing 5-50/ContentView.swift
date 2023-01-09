
import SwiftUI

struct ContentView: View {
   let myfont = Font.system(size: 100)

   var body: some View {
      Image(systemName: "envelope")
         .font(myfont.weight(.semibold))
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

