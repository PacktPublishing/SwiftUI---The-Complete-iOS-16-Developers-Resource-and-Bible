
import SwiftUI

struct ContentView: View {
   var body: some View {
      TabView {
         BooksView()
            .tabItem({
               Label("Books", systemImage: "book.circle")
            })
         SettingsView()
            .tabItem({
               Label("Settings", systemImage: "gear")
            })
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

