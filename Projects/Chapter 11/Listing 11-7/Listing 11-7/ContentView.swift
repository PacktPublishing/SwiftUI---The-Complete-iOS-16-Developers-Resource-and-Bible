
import SwiftUI

struct ContentView: View {
   let gradient = Gradient(colors: [Color.red, Color.green])

   var body: some View {
      RoundedRectangle(cornerRadius: 25)
         .fill(.linearGradient(gradient, startPoint: .bottom, endPoint: .top))
         .frame(width: 100, height: 100)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

