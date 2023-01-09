
import SwiftUI

struct ContentView: View {
   let fontSize: CGFloat = 100

   var body: some View {
      Image(systemName: "envelope.circle")
         .font(Font.system(size: fontSize))
         .onAppear(perform: {
            print("Current font size: \(self.fontSize)")
         })
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

