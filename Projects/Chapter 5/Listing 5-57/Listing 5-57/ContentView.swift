
import SwiftUI

struct MyModifiers: ViewModifier {
   func body(content: Content) -> some View {
      content
         .font(Font.system(size: 100).weight(.semibold))
         .foregroundColor(Color.blue)
   }
}
struct ContentView: View {
   var body: some View {
      Image(systemName: "envelope.circle")
         .modifier(MyModifiers())
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

