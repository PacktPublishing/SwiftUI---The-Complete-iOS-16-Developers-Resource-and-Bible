
import SwiftUI

struct ContentView: View {
   @State private var currentValue: Float = 5

   var body: some View {
      VStack {
         ProgressView(value: currentValue, total: 10)
         Slider(value: $currentValue, in: 0...10)
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

