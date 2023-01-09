
import SwiftUI

struct ContentView: View {
   @State private var setting1: Bool = true
   @State private var setting2: Bool = true
   @State private var setting3: Bool = true

   var body: some View {
      GroupBox("Settings") {
         VStack(spacing: 10) {
            Toggle("Autocorrection", isOn: $setting1)
            Toggle("Capitalization", isOn: $setting2)
            Toggle("Editable", isOn: $setting3)
         }
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

