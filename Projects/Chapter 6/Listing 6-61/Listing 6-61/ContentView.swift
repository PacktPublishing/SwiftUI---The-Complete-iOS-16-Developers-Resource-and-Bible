
import SwiftUI

struct ContentView: View {
   var body: some View {
      GeometryReader { geometry in
         HStack {
            Image("spot1")
               .resizable()
               .scaledToFit()
               .frame(width: geometry.size.width / 2, height: geometry.size.height / 4)
               .background(Color.gray)
         }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

