
import SwiftUI

struct MyStyle: ButtonStyle {
   func makeBody(configuration: MyStyle.Configuration) -> some View {
      let pressed = configuration.isPressed
      return configuration.label
         .padding()
         .border(Color.green, width: 5)
         .scaleEffect(pressed ? 1.2 : 1.0)
   }
}
struct ContentView: View {
   @State private var color = Color.gray

   var body: some View {
      VStack {
         Text("Default Title")
            .padding()
            .foregroundColor(color)
         Button("Change Color") {
            color = Color.green
         }.buttonStyle(MyStyle())
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

