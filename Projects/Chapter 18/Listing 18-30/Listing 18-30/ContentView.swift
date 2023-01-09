
import SwiftUI

struct ContentView: View {
   @State private var selectedColor: Color = .white
   
   var body: some View {
      VStack {
         ColorPicker("Select a Color", selection: $selectedColor)
            .padding()
         Spacer()
      }.background(selectedColor)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

