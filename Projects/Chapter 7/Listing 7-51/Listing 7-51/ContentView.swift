
import SwiftUI

struct ContentView: View {
   @State private var setActive: Bool = false
   @State private var setShowPictures: Bool = false
   @State private var setTotal: Int = 10

   var body: some View {
      Form {
         Toggle("Active", isOn: $setActive)
         Toggle("Show Pictures", isOn: $setShowPictures)
         HStack {
            Text("Total")
            Spacer()
            Text(String(setTotal))
            Stepper("", value: $setTotal, in: 0...10)
               .labelsHidden()
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

