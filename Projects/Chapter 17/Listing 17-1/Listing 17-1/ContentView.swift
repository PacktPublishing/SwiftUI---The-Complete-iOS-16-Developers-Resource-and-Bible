
import SwiftUI

struct ContentView: View {
   @State private var searchURL = "https://www.formasterminds.com"

   var body: some View {
      VStack {
         Link("Open Web", destination: URL(string: searchURL)!)
            .buttonStyle(.borderedProminent)
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

