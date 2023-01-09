
import SwiftUI

struct ContentView: View {
   var body: some View {
      WebView(searchURL: URL(string: "https://www.google.com")!)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

