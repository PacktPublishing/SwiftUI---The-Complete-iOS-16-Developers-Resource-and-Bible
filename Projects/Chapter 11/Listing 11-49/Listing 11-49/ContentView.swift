
import SwiftUI

struct ContentView: View {
   @State private var boxScale: CGFloat = 1

   var body: some View {
      VStack {
         HStack {
            Rectangle()
               .fill(Color.blue)
               .frame(width: 50, height: 50)
               .scaleEffect(boxScale)
         }.frame(width: 250, height: 120)
         Button("Animate") {
            withAnimation(.linear) {
               boxScale = 2
            }
         }
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

