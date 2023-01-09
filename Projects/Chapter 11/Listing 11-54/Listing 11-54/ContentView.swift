
import SwiftUI

struct ContentView: View {
   @State private var smiling: Bool = true

   var body: some View {
      VStack {
         Face(smile: smiling ? 1 : 0)
            .stroke(Color.blue, lineWidth: 5)
            .frame(width: 100, height: 120)
         Button("Change") {
            withAnimation(.default) {
               smiling.toggle()
            }
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

