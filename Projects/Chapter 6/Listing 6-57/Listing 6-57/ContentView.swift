
import SwiftUI

struct ContentView: View {
   @State private var currentValue: Float = 0
   @State private var goingUp: Bool = true

   var body: some View {
      VStack {
         HStack {
            Text("Current Value: \(currentValue.formatted(.number.precision(.fractionLength(0))))")
            Image(systemName: goingUp ? "arrow.up" : "arrow.down")
               .foregroundColor(goingUp ? Color.green : Color.red)
            Stepper("", onIncrement: {
               currentValue += 5
               goingUp = true
            }, onDecrement: {
               currentValue -= 5
               goingUp = false
            }).labelsHidden()
         }
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

