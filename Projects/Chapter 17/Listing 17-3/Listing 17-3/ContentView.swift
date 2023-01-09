
import SwiftUI

struct ContentView: View {
   @Environment(\.openURL) var openURL
   @State private var searchURL = ""

   var body: some View {
      VStack {
         TextField("Insert URL", text: $searchURL)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
            .disableAutocorrection(true)
         Button("Open Web") {
            if !searchURL.isEmpty {
               var components = URLComponents(string: searchURL)
               components?.scheme = "https"
               if let newURL = components?.string {
                  if let url = newURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                     openURL(URL(string: url)!)
                  }
               }
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

