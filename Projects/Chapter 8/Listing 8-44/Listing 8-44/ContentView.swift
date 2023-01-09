
import SwiftUI

struct ContentView: View {
   @State private var selectedView: Int = 1

   var body: some View {
      TabView(selection: $selectedView) {
         BooksView()
            .tabItem({
               Label("Books", systemImage: "book.circle")
            }).tag(0)
         SettingsView()
            .tabItem({
               Label("Settings", systemImage: "gear")
            }).tag(1)
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

