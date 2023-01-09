
import SwiftUI

struct ContentView: View {
   var thumbnail: String {
      get async {
         try? await Task.sleep(nanoseconds: 3 * 1000000000)
         return "mythumbnail"
      }
   }
   var body: some View {
      VStack {
         Text("Hello, world!")
            .padding()
      }
      .onAppear {
         Task(priority: .background) {
            let imageName = await thumbnail
            print(imageName)
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

