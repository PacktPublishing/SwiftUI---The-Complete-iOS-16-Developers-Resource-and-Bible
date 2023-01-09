
import SwiftUI

struct ContentView: View {
   @Environment(\.openURL) var openURL
   @State private var searchURL = "https://www.formasterminds.com"

   var body: some View {
      VStack {
         Button("Open Web") {
            if let url = searchURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
               openURL(URL(string: url)!)
            }
         }.buttonStyle(.borderedProminent)
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

