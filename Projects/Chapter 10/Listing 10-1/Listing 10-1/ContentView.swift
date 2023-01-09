
import SwiftUI

struct ContentView: View {
   @AppStorage("counter") var mycounter: Double = 0

   var body: some View {
      HStack {
         Stepper("", value: $mycounter)
            .labelsHidden()
         Text("\(mycounter.formatted(.number.precision(.fractionLength(0))))")
            .font(.title)
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

