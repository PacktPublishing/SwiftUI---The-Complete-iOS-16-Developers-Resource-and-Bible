
import SwiftUI

struct ContentView: View {
   @State private var myText: String = "Hello, world!"

   var body: some View {
      VStack {
         Text(myText)
            .padding()
      }
      .onAppear {
         Task(priority: .background) {
            await loadImage(name: "image1")
         }
      }
   }
   @MainActor func loadImage(name: String) async {
      myText = name
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

