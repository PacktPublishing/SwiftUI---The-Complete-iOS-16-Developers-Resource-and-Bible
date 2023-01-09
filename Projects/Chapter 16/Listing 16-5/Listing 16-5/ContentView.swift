
import SwiftUI

struct ContentView: View {
   var body: some View {
      NavigationStack {
         VStack {
            NavigationLink("Open UIKit View", destination: {
               MyViewController()
            }).buttonStyle(.borderedProminent)
            Spacer()
         }.padding()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

