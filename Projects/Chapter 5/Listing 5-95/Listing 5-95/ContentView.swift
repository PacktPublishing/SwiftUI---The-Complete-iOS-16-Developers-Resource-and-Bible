
import SwiftUI

struct ContentView: View {
   var body: some View {
      Text("Hello World")
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      Group {
         ContentView()
            .environment(\.dynamicTypeSize, .small)
            .previewDisplayName("Small")
         ContentView()
            .environment(\.dynamicTypeSize, .large)
            .previewDisplayName("Large")
         ContentView()
            .environment(\.dynamicTypeSize, .xxLarge)
            .previewDisplayName("XXLarge")
      }.previewLayout(PreviewLayout.sizeThatFits)
   }
}
