
import SwiftUI

struct MenuView: View {
   @EnvironmentObject var appData: ApplicationData
   @Binding var selected: ConsumableItems?

   var body: some View {
      List(selection: $selected) {
         ForEach(appData.listOfItems) { sections in
            Section(header: Text(sections.name)) {
               ForEach(sections.sectionItems) { item in
                  NavigationLink(item.name, value: item)
               }
            }
            #if os(macOS)
            .collapsible(true)
            #endif
         }
      }.listStyle(.sidebar)
   }
}
struct MenuView_Previews: PreviewProvider {
   static var previews: some View {
      MenuView(selected: .constant(nil))
         .environmentObject(ApplicationData())
   }
}
