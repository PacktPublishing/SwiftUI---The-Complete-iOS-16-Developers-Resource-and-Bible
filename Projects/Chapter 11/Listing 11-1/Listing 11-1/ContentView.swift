
import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack {
         ScrollView(.horizontal, showsIndicators: true) {
            HStack {
               Rectangle()
                  .frame(width: 100, height: 100)
               RoundedRectangle(cornerRadius: 25, style: .continuous)
                  .frame(width: 100, height: 100)
               Circle()
                  .frame(width: 100, height: 100)
               Ellipse()
                  .frame(width: 100, height: 50)
               Capsule()
                  .frame(width: 100, height: 50)
            }.padding()
         }
         Spacer()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

