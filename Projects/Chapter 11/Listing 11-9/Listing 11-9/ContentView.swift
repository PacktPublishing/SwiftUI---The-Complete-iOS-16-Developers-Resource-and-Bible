
import SwiftUI

struct ContentView: View {
   let gradient = Gradient(colors: [Color.red, Color.white])

   var body: some View {
      RoundedRectangle(cornerRadius: 25)
         .fill(.radialGradient(gradient, center: .center, startRadius: 0, endRadius: 120))
         .frame(width: 100, height: 100)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

