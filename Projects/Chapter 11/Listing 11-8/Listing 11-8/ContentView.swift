
import SwiftUI

struct ContentView: View {
   let gradient = Gradient(stops: [
      Gradient.Stop(color: Color.red, location: 0.0),
      Gradient.Stop(color: Color.green, location: 0.4)
   ])
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

