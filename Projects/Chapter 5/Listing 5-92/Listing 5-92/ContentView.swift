
import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack {
         Image(systemName: "globe")
            .imageScale(.large)
            .foregroundColor(.accentColor)
         Text("Hello, world!")
      }
      .padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      Group {
         ContentView()
            .previewDevice(PreviewDevice(stringLiteral: "iPhone 13"))
            .previewDisplayName("iPhone 13")
         ContentView()
            .previewDevice(PreviewDevice(stringLiteral: "iPhone 13 Pro"))
            .previewDisplayName("iPhone 13 Pro")
      }
   }
}

