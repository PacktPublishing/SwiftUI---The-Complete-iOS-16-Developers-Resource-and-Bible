
import SwiftUI

struct ContentView: View {
   var body: some View {
      getView()
   }
   func getView() -> AnyView {
      let valid = true
      var myView: AnyView!

      if valid {
         myView = AnyView(Image(systemName: "keyboard"))
      } else {
         myView = AnyView(Text("The state is invalid"))
      }
      return myView
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

