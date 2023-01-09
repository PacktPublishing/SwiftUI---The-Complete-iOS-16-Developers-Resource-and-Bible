
import SwiftUI

struct ContentView: View {
   let gradient = Gradient(colors: [Color.red, Color.white])

   var body: some View {
      RoundedRectangle(cornerRadius: 25)
         .fill(.conicGradient(gradient, center: .center, angle: .degrees(180)))
         .frame(width: 100, height: 100)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

