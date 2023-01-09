
import SwiftUI

struct ContentView: View {
   @State private var selected: ConsumableItems?
   @State private var visibility: NavigationSplitViewVisibility = .automatic

   var body: some View {
      NavigationSplitView(columnVisibility: $visibility, sidebar: {
         MenuView(selected: $selected)
      }, detail: {
         let item = selected ?? ConsumableItems(name: "", items: [])
         DetailView(items: item)
      })
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

