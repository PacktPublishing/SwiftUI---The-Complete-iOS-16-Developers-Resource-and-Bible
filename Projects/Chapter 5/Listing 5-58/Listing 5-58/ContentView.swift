
import SwiftUI

struct MyModifiers: ViewModifier {
   var size: CGFloat
    
   init(size: CGFloat) {
      self.size = size
   }
   func body(content: Content) -> some View {
      content
         .font(Font.system(size: size).weight(.semibold))
         .foregroundColor(Color.blue)
   }
}
struct ContentView: View {
   var body: some View {
      Image(systemName: "envelope.circle")
         .modifier(MyModifiers(size: 50))
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

