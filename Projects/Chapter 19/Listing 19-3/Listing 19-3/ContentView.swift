
import SwiftUI

struct ContentView: View {
   @State private var visibility: NavigationSplitViewVisibility = .automatic

   var body: some View {
      NavigationSplitView(columnVisibility: $visibility, sidebar: {
         MenuView()
      }, detail: {
         #if os(macOS)
            MacDetailView()
         #else
            MobileDetailView()
         #endif
      })
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

